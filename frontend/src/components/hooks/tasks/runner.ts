import { IRunResult, ITask, ITest } from "../types/type";

const keywords = ["for", "while", "if", "delete", "switch"];
const timeLimit = 2000;

const workerCode = String.raw`
const equal = (a, b) => {
  if (a === b) return true;
  if (typeof a !== typeof b || a === null || b === null || typeof a !== "object") return false;
  if (Array.isArray(a) !== Array.isArray(b)) return false;
  if (Array.isArray(a)) return a.length === b.length && a.every((x, i) => equal(x, b[i]));
  const ka = Object.keys(a);
  const kb = Object.keys(b);
  return ka.length === kb.length && ka.every((k) => Object.prototype.hasOwnProperty.call(b, k) && equal(a[k], b[k]));
};
const show = (value) => {
  if (value === undefined) return "undefined";
  if (typeof value === "function") return "функция";
  try {
    return JSON.stringify(value);
  } catch (e) {
    return String(value);
  }
};
const plain = (value) => {
  if (value === undefined) return undefined;
  try {
    return JSON.parse(JSON.stringify(value));
  } catch (e) {
    return value;
  }
};
self.onmessage = (event) => {
  const { code, fn, tests } = event.data;
  let func;
  try {
    func = new Function(code + "\nreturn typeof " + fn + " === \"function\" ? " + fn + " : null;")();
  } catch (e) {
    self.postMessage({ status: "syntax", message: e.message });
    return;
  }
  if (!func) {
    self.postMessage({ status: "syntax", message: "Функция " + fn + " не найдена. Не меняй её имя." });
    return;
  }
  for (let i = 0; i < tests.length; i++) {
    const test = tests[i];
    const args = JSON.parse(JSON.stringify(test.input));
    let got;
    try {
      got = func(...args);
    } catch (e) {
      self.postMessage({ status: "error", message: e.message, index: i });
      return;
    }
    if (!equal(plain(got), test.output)) {
      self.postMessage({ status: "failed", index: i, got: show(got) });
      return;
    }
  }
  self.postMessage({ status: "passed", total: tests.length });
};
`;

const stripComments = (code: string) =>
  code.replace(/\/\*[\s\S]*?\*\//g, "").replace(/\/\/.*$/gm, "");

const uses = (code: string, token: string) => {
  if (keywords.includes(token)) return new RegExp(`\\b${token}\\b`).test(code);
  if (/^[a-z][a-zA-Z]*$/.test(token))
    return new RegExp(`\\.${token}\\s*\\(`).test(code);
  if (/^[A-Z][a-zA-Z]*$/.test(token))
    return new RegExp(`\\b${token}\\b`).test(code);
  return code.includes(token);
};

export const showToken = (token: string) =>
  keywords.includes(token) || !/^[a-z][a-zA-Z]*$/.test(token)
    ? token
    : `.${token}()`;

export const showArgs = (test: ITest) =>
  test.input.map((value) => JSON.stringify(value)).join(", ");

export const showValue = (value: unknown) => JSON.stringify(value);

export const starterCode = (task: ITask) =>
  `function ${task.fn}(${task.params}) {\n  \n}`;

export const checkRules = (code: string, task: ITask): IRunResult | null => {
  const clean = stripComments(code);
  const banned = task.forbidden.find((token) => uses(clean, token));
  if (banned) {
    return {
      status: "rule",
      message: `В этой задаче нельзя использовать ${showToken(banned)}. Реши её по-другому.`,
    };
  }
  const missing = task.required.find((token) => !uses(clean, token));
  if (missing) {
    return {
      status: "rule",
      message: `В этой задаче нужно использовать ${showToken(missing)}.`,
    };
  }
  return null;
};

export const runTests = (code: string, task: ITask) =>
  new Promise<IRunResult>((resolve) => {
    const url = URL.createObjectURL(
      new Blob([workerCode], { type: "text/javascript" }),
    );
    const worker = new Worker(url);

    const finish = (result: IRunResult) => {
      clearTimeout(timer);
      worker.terminate();
      URL.revokeObjectURL(url);
      resolve(result);
    };

    const timer = setTimeout(() => {
      finish({
        status: "timeout",
        message: "Код выполнялся слишком долго. Проверь, не получился ли бесконечный цикл.",
      });
    }, timeLimit);

    worker.onmessage = (event) => {
      const data = event.data;
      const test = typeof data.index === "number" ? task.tests[data.index] : null;
      const details = test
        ? { input: showArgs(test), expected: showValue(test.output) }
        : {};

      if (data.status === "passed") {
        finish({
          status: "passed",
          message: `Все тесты пройдены: ${data.total} из ${data.total}`,
        });
      } else if (data.status === "failed") {
        finish({
          status: "failed",
          message: `Тест ${data.index + 1} из ${task.tests.length} не пройден`,
          ...details,
          got: data.got,
        });
      } else if (data.status === "error") {
        finish({
          status: "error",
          message: `Ошибка при выполнении: ${data.message}`,
          ...details,
        });
      } else {
        finish({ status: "syntax", message: `Ошибка в коде: ${data.message}` });
      }
    };

    worker.onerror = (event) => {
      event.preventDefault();
      finish({ status: "syntax", message: `Ошибка в коде: ${event.message}` });
    };

    worker.postMessage({ code, fn: task.fn, tests: task.tests });
  });
