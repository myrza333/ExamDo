"use client";
import { useEffect, useRef, useState } from "react";
import scss from "./Practice.module.scss";
import {
  ArrowIcon,
  CodeIcon,
  PlayIcon,
  ResetIcon,
} from "@/components/ui/icons/Icons";
import Stage from "@/components/ui/stage/Stage";
import CodeEditor from "@/components/ui/codeEditor/CodeEditor";
import { useGetTasks } from "@/components/hooks/tasks/useGetTasks";
import { useGetSolution } from "@/components/hooks/tasks/useGetSolution";
import { useSetProgress } from "@/components/hooks/progress/useProgress";
import {
  checkRules,
  runTests,
  showArgs,
  showToken,
  showValue,
  starterCode,
} from "@/components/hooks/tasks/runner";
import { IRunResult, TLevel } from "@/components/hooks/types/type";

const levels: { value: TLevel; label: string }[] = [
  { value: "easy", label: "Лёгкие" },
  { value: "hard", label: "Сложные" },
];

const maxAttempts = 2;

const Practice = () => {
  const cardRef = useRef<HTMLDivElement>(null);
  const [level, setLevel] = useState<TLevel>("easy");
  const [index, setIndex] = useState(0);
  const [code, setCode] = useState("");
  const [attempts, setAttempts] = useState(0);
  const [result, setResult] = useState<IRunResult | null>(null);
  const [status, setStatus] = useState<"idle" | "passed" | "failed">("idle");
  const [running, setRunning] = useState(false);
  const [solved, setSolved] = useState(0);
  const [finished, setFinished] = useState(false);

  const { data: tasks, isLoading, isError, isFetching, refetch } =
    useGetTasks(level);
  const {
    mutate: getSolution,
    data: solution,
    isPending: isSolutionLoading,
    reset: resetSolution,
  } = useGetSolution();
  const setProgress = useSetProgress("practice");

  const total = tasks?.length ?? 5;
  const task = tasks?.[index];
  const done = status !== "idle";
  const isLast = index + 1 === total;
  const answered = finished ? total : index + (done ? 1 : 0);

  useEffect(() => {
    if (!task) return;
    setCode(starterCode(task));
    setAttempts(0);
    setResult(null);
    setStatus("idle");
    resetSolution();
  }, [task?.id]);

  useEffect(() => {
    setProgress({ answered, total, finished, title: task?.title ?? "" });
  }, [answered, total, finished, task?.title]);

  const scrollToCard = () => {
    const top = cardRef.current?.getBoundingClientRect().top ?? 0;
    if (top < 70) {
      window.scrollTo({ top: window.scrollY + top - 80, behavior: "smooth" });
    }
  };

  const resetRound = () => {
    setIndex(0);
    setSolved(0);
    setFinished(false);
    setStatus("idle");
    setResult(null);
    setAttempts(0);
    resetSolution();
  };

  const onLevel = (value: TLevel) => {
    if (value === level) return;
    resetRound();
    setLevel(value);
  };

  const onRun = async () => {
    if (!task || running || done) return;
    const rule = checkRules(code, task);
    if (rule) {
      setResult(rule);
      return;
    }
    setRunning(true);
    const run = await runTests(code, task);
    setRunning(false);

    if (run.status === "passed") {
      setResult(run);
      setStatus("passed");
      setSolved((prev) => prev + 1);
      return;
    }
    if (run.status === "syntax") {
      setResult(run);
      return;
    }
    const next = attempts + 1;
    setAttempts(next);
    setResult(run);
    if (next >= maxAttempts) {
      setStatus("failed");
      getSolution(task.id);
    }
  };

  const onNext = () => {
    if (isLast) {
      setFinished(true);
    } else {
      setIndex((prev) => prev + 1);
    }
    scrollToCard();
  };

  const onRestart = async () => {
    await refetch();
    resetRound();
    scrollToCard();
  };

  const renderFeedback = () => {
    if (!result) return null;

    if (result.status === "passed") {
      return (
        <div className={`${scss.feedback} ${scss.good}`}>
          <p className={scss.feedbackTitle}>Верно!</p>
          <p>{result.message}</p>
        </div>
      );
    }

    if (result.status === "rule" || result.status === "syntax") {
      return (
        <div className={`${scss.feedback} ${scss.warn}`}>
          <p className={scss.feedbackTitle}>
            {result.status === "rule" ? "Правило задачи" : "Код не запустился"}
          </p>
          <p>{result.message}</p>
          <p className={scss.note}>Эта проверка не тратит попытку.</p>
        </div>
      );
    }

    return (
      <div className={`${scss.feedback} ${scss.bad}`}>
        <p className={scss.feedbackTitle}>
          {status === "failed"
            ? "Задача не решена"
            : "Неправильно, попробуй ещё раз"}
        </p>
        <p>{result.message}</p>
        {result.input !== undefined && (
          <div className={scss.details}>
            <p>
              <span>Вход:</span> {result.input}
            </p>
            <p>
              <span>Ожидалось:</span> {result.expected}
            </p>
            {result.got !== undefined && (
              <p>
                <span>Получилось:</span> {result.got}
              </p>
            )}
          </div>
        )}
      </div>
    );
  };

  const renderSolution = () => {
    if (status !== "failed") return null;
    if (isSolutionLoading || !solution) {
      return <p className={scss.loadingText}>Загружаем решение...</p>;
    }
    return (
      <div className={scss.solution}>
        <p className={scss.solutionTitle}>Правильное решение</p>
        <pre>
          <code>{solution.solution}</code>
        </pre>
        <p className={scss.solutionTitle}>Ход решения</p>
        <ol>
          {solution.explanation.map((step, i) => (
            <li key={i}>{step}</li>
          ))}
        </ol>
      </div>
    );
  };

  const renderBody = () => {
    if (isLoading || isFetching) {
      return <p className={scss.status}>Загружаем задачи...</p>;
    }

    if (isError || !task) {
      return (
        <div className={scss.status}>
          <p>Не удалось загрузить задачи</p>
          <button className={scss.run} onClick={() => refetch()}>
            Попробовать ещё раз
          </button>
        </div>
      );
    }

    if (finished) {
      return (
        <div className={scss.result}>
          <p className={scss.resultKicker}>Раунд завершён</p>
          <h3>
            Решено {solved} из {total}
          </h3>
          <div className={scss.stats}>
            <div className={scss.goodStat}>
              <p>{solved}</p>
              <span>Решено</span>
            </div>
            <div className={scss.badStat}>
              <p>{total - solved}</p>
              <span>Не решено</span>
            </div>
          </div>
          <button className={scss.run} onClick={onRestart}>
            <ResetIcon />
            Пройти ещё раз
          </button>
        </div>
      );
    }

    return (
      <div className={scss.grid}>
        <div className={scss.task}>
          <div className={scss.taskTop}>
            <span className={scss.lang}>
              <CodeIcon />
              {task.topic}
            </span>
            <span className={scss.attempts}>
              Попытка {Math.min(attempts + 1, maxAttempts)} из {maxAttempts}
            </span>
          </div>
          <h3>{task.title}</h3>
          <p className={scss.text}>{task.description}</p>
          {task.tests[0] && (
            <div className={scss.example}>
              <p>Пример</p>
              <div>
                <p>
                  <span>Вход:</span> <span>{showArgs(task.tests[0])}</span>
                </p>
                <p>
                  <span>Результат:</span>{" "}
                  <span>{showValue(task.tests[0].output)}</span>
                </p>
              </div>
            </div>
          )}
          {(task.forbidden.length > 0 || task.required.length > 0) && (
            <div className={scss.rules}>
              {task.required.length > 0 && (
                <div>
                  <p>Нужно использовать</p>
                  <div className={scss.chips}>
                    {task.required.map((el) => (
                      <code key={el} className={scss.need}>
                        {showToken(el)}
                      </code>
                    ))}
                  </div>
                </div>
              )}
              {task.forbidden.length > 0 && (
                <div>
                  <p>Нельзя использовать</p>
                  <div className={scss.chips}>
                    {task.forbidden.map((el) => (
                      <code key={el} className={scss.ban}>
                        {showToken(el)}
                      </code>
                    ))}
                  </div>
                </div>
              )}
            </div>
          )}
        </div>

        <div className={scss.editor}>
          <div className={scss.editorTop}>
            <div className={scss.dots}>
              <span></span>
              <span></span>
              <span></span>
              <p>{task.fn}.js</p>
            </div>
            {!done && (
              <button
                onClick={() => {
                  setCode(starterCode(task));
                  setResult(null);
                }}
              >
                <ResetIcon />
                Сбросить
              </button>
            )}
          </div>
          <CodeEditor value={code} onChange={setCode} disabled={done} />
          <div className={scss.output}>
            {renderFeedback()}
            {renderSolution()}
          </div>
          <div className={scss.editorBottom}>
            <span>JavaScript</span>
            {done ? (
              <button className={scss.run} onClick={onNext}>
                {isLast ? "Завершить" : "Следующая задача"}
                <ArrowIcon />
              </button>
            ) : (
              <button className={scss.run} onClick={onRun} disabled={running}>
                <PlayIcon />
                {running ? "Проверяем..." : "Запустить и проверить"}
              </button>
            )}
          </div>
        </div>
      </div>
    );
  };

  return (
    <section id="practice" className={scss.container}>
      <Stage
        number={2}
        title="Практика"
        link={{ href: "#exam", label: "К этапу 1", back: true }}
      />
      <div className={scss.head}>
        <h2>Теперь покажите, как вы кодите</h2>
        <p>
          Решите задачу прямо в браузере. На каждую задачу две попытки, после
          второй ошибки покажем решение с разбором.
        </p>
      </div>

      <div className={scss.toolbar}>
        <div className={scss.levels}>
          {levels.map((el) => (
            <button
              key={el.value}
              className={level === el.value ? scss.active : ""}
              onClick={() => onLevel(el.value)}
            >
              {el.label}
            </button>
          ))}
        </div>
        {!finished && tasks && (
          <span className={scss.counter}>
            Задача {Math.min(index + 1, total)} из {total}
          </span>
        )}
      </div>

      <div className={scss.card} ref={cardRef}>
        {renderBody()}
      </div>
    </section>
  );
};

export default Practice;
