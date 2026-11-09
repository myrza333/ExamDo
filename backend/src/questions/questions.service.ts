import { pool } from "../plugins/pg";
import { apiErrors } from "../utils/apiErrors";
import { cached } from "../utils/cache";
import { mixTopics, pickByTopic, shuffle } from "../utils/random";

interface IQuestion {
  id: number;
  topic: string;
  question: string;
  answer: string;
  wrong_answers: string[];
}

interface ICheckBody {
  id: number;
  answer: string;
}

const getAllQuestions = () =>
  cached("questions", async () => {
    const result = await pool.query<IQuestion>("select * from questions");
    return result.rows;
  });

export const getRandomQuestionsService = async (count: number) => {
  const questions = await getAllQuestions();

  return mixTopics(pickByTopic(shuffle(questions), count, 6)).map((el) => ({
    id: el.id,
    topic: el.topic,
    question: el.question,
    options: shuffle([el.answer, ...el.wrong_answers]),
  }));
};

export const checkAnswerService = async (body: ICheckBody) => {
  if (!Number.isInteger(body.id) || typeof body.answer !== "string")
    throw apiErrors.badRequest("id and answer are required");

  const questions = await getAllQuestions();
  const question = questions.find((el) => el.id === body.id);
  if (!question) throw apiErrors.notFound("Question not found");

  return {
    correct: question.answer === body.answer,
    answer: question.answer,
  };
};
