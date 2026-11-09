export interface IGuest {
  id: number;
  name: string;
}

export interface IQuestion {
  id: number;
  topic: string;
  question: string;
  options: string[];
}

export interface ICheckBody {
  id: number;
  answer: string;
}

export interface ICheckResult {
  correct: boolean;
  answer: string;
}

export interface IAdminGuest {
  id: number;
  name: string;
  created_at: string;
}

export interface IAdminLoginBody {
  login: string;
  password: string;
}

export interface IProgress {
  answered: number;
  total: number;
  finished: boolean;
  title?: string;
}

export type TLevel = "easy" | "hard";

export interface ITest {
  input: unknown[];
  output: unknown;
}

export interface ITask {
  id: number;
  level: TLevel;
  topic: string;
  title: string;
  description: string;
  fn: string;
  params: string;
  tests: ITest[];
  forbidden: string[];
  required: string[];
}

export interface ISolution {
  solution: string;
  explanation: string[];
}

export interface IRunResult {
  status: "passed" | "failed" | "error" | "timeout" | "syntax" | "rule";
  message: string;
  input?: string;
  expected?: string;
  got?: string;
}
