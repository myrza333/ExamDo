"use client";
import { useEffect, useRef, useState } from "react";
import scss from "./Exam.module.scss";
import { ArrowIcon, ResetIcon } from "@/components/ui/icons/Icons";
import Stage from "@/components/ui/stage/Stage";
import { useGetQuestions } from "@/components/hooks/questions/useGetQuestions";
import { useCheckAnswer } from "@/components/hooks/questions/useCheckAnswer";
import { useSetProgress } from "@/components/hooks/progress/useProgress";

const letters = ["A", "B", "C", "D"];

const Exam = () => {
  const cardRef = useRef<HTMLDivElement>(null);
  const [index, setIndex] = useState(0);
  const [selected, setSelected] = useState<string | null>(null);
  const [correctCount, setCorrectCount] = useState(0);
  const [finished, setFinished] = useState(false);

  const { data: questions, isLoading, isError, isFetching, refetch } =
    useGetQuestions();
  const {
    mutate: checkAnswer,
    data: result,
    isPending,
    isError: isCheckError,
    reset: resetCheck,
  } = useCheckAnswer();
  const setProgress = useSetProgress("exam");

  const total = questions?.length ?? 15;
  const question = questions?.[index];
  const answered = finished ? total : index + (result ? 1 : 0);
  const percent = Math.round((answered / total) * 100);
  const isLast = index + 1 === total;

  useEffect(() => {
    setProgress({ answered, total, finished });
  }, [answered, total, finished]);

  const scrollToCard = () => {
    const top = cardRef.current?.getBoundingClientRect().top ?? 0;
    if (top < 70) {
      window.scrollTo({ top: window.scrollY + top - 80, behavior: "smooth" });
    }
  };

  const onCheck = () => {
    if (!question || !selected) return;
    checkAnswer(
      { id: question.id, answer: selected },
      {
        onSuccess: (data) => {
          if (data.correct) setCorrectCount((prev) => prev + 1);
        },
      },
    );
  };

  const onNext = () => {
    resetCheck();
    setSelected(null);
    if (isLast) {
      setFinished(true);
    } else {
      setIndex((prev) => prev + 1);
    }
    scrollToCard();
  };

  const onRestart = async () => {
    await refetch();
    resetCheck();
    setSelected(null);
    setIndex(0);
    setCorrectCount(0);
    setFinished(false);
    scrollToCard();
  };

  const getClass = (option: string) => {
    if (result) {
      if (option === result.answer) return scss.correct;
      if (option === selected) return scss.wrong;
      return "";
    }
    return option === selected ? scss.selected : "";
  };

  const renderContent = () => {
    if (isLoading || isFetching) {
      return <p className={scss.status}>Загружаем вопросы...</p>;
    }

    if (isError || !question) {
      return (
        <div className={scss.status}>
          <p>Не удалось загрузить вопросы</p>
          <button className={scss.check} onClick={() => refetch()}>
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
            Верно {correctCount} из {total}
          </h3>
          <div className={scss.stats}>
            <div className={scss.good}>
              <p>{correctCount}</p>
              <span>Верно</span>
            </div>
            <div className={scss.bad}>
              <p>{total - correctCount}</p>
              <span>Неверно</span>
            </div>
          </div>
          <div className={scss.actions}>
            <button className={scss.check} onClick={onRestart}>
              <ResetIcon />
              Пройти ещё раз
            </button>
          </div>
        </div>
      );
    }

    return (
      <>
        <div className={scss.questionTop}>
          <span className={scss.tag}>{question.topic}</span>
          <span className={scss.count}>
            {index + 1} / {total}
          </span>
        </div>
        <h3>{question.question}</h3>
        <div className={scss.answers}>
          {question.options.map((option, i) => (
            <button
              key={option}
              className={`${scss.answer} ${getClass(option)}`}
              disabled={!!result || isPending}
              onClick={() => setSelected(option)}
            >
              <span>{letters[i]}</span>
              {option}
            </button>
          ))}
        </div>
        {isCheckError && (
          <p className={scss.error}>Не удалось проверить ответ, попробуй ещё раз</p>
        )}
        <div className={scss.actions}>
          {result ? (
            <button className={scss.check} onClick={onNext}>
              {isLast ? "Завершить" : "Следующий вопрос"}
              <ArrowIcon />
            </button>
          ) : (
            <button
              className={scss.check}
              disabled={!selected || isPending}
              onClick={onCheck}
            >
              {isPending ? "Проверяем..." : "Проверить ответ"}
              <ArrowIcon />
            </button>
          )}
        </div>
      </>
    );
  };

  return (
    <section id="exam" className={scss.container}>
      <div className="container">
        <Stage
          number={1}
          title="Теория"
          link={{ href: "#practice", label: "К этапу 2" }}
        />
        <h2 className={scss.title}>Проверьте фундамент</h2>

        <div className={scss.card} ref={cardRef}>
          <aside className={scss.aside}>
            <div className={scss.steps}>
              <div className={`${scss.step} ${scss.active}`}>
                <span>01</span>
                <div>
                  <p>Теория</p>
                  <p>
                    {finished
                      ? "Раунд завершён"
                      : `${answered} из ${total} вопросов`}
                  </p>
                </div>
              </div>
              <a href="#practice" className={scss.step}>
                <span>02</span>
                <div>
                  <p>JavaScript</p>
                  <p>Практика</p>
                </div>
              </a>
            </div>
            <div className={scss.progress}>
              <div className={scss.progressRow}>
                <span>Прогресс</span>
                <span>{percent}%</span>
              </div>
              <div className={scss.bar}>
                <div style={{ width: `${percent}%` }}></div>
              </div>
            </div>
          </aside>

          <div className={scss.question}>{renderContent()}</div>
        </div>
      </div>
    </section>
  );
};

export default Exam;
