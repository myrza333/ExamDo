"use client";
import scss from "./Hero.module.scss";
import { useProgress } from "@/components/hooks/progress/useProgress";
import {
  ArrowIcon,
  CheckIcon,
  ChevronIcon,
  CodeIcon,
  StarIcon,
} from "@/components/ui/icons/Icons";

const features = ["Без регистрации", "Мгновенная проверка"];

const Hero = () => {
  const { data: exam } = useProgress("exam");
  const { data: practice } = useProgress("practice");
  const stages = [
    { label: "Этап 1 · Теория", progress: exam },
    { label: "Этап 2 · Практика", progress: practice },
  ];
  const started = exam.answered + practice.answered > 0;
  const status =
    exam.finished && practice.finished
      ? "Завершён"
      : started
        ? "В процессе"
        : "Не начат";

  return (
    <section id="home" className={scss.container}>
      <div className={scss.glow}></div>
      <div className={scss.mainContainer}>
        <div className={scss.info}>
          <div className={scss.badge}>
            <StarIcon />
            Тренажёр для будущих fullstack-разработчиков
          </div>
          <h1>Бесплатная подготовка к&nbsp;экзамену</h1>
          <p className={scss.text}>
            Теория и практика fullstack-разработки в одном месте. Без
            регистрации, лишнего стресса и скучных заданий.
          </p>
          <div className={scss.buttons}>
            <a href="#exam" className={scss.primary}>
              Пройти экзамен
              <ArrowIcon />
            </a>
          </div>
          <div className={scss.features}>
            {features.map((el) => (
              <span key={el}>
                <CheckIcon />
                {el}
              </span>
            ))}
          </div>
        </div>

        <div className={scss.preview}>
          <div className={scss.previewGlow}></div>
          <div className={scss.card}>
            <div className={scss.cardInner}>
              <div className={scss.cardTop}>
                <div>
                  <p className={scss.cardKicker}>Ваш прогресс</p>
                  <p className={scss.cardTitle}>Fullstack Base</p>
                </div>
                <span className={scss.status}>{status}</span>
              </div>

              {stages.map((el) => (
                <div key={el.label} className={scss.module}>
                  <div className={scss.moduleRow}>
                    <span>{el.label}</span>
                    <span>
                      {el.progress.answered} из {el.progress.total}
                    </span>
                  </div>
                  <div className={scss.bar}>
                    <div
                      style={{
                        width: `${Math.round((el.progress.answered / el.progress.total) * 100)}%`,
                      }}
                    ></div>
                  </div>
                </div>
              ))}

              <a href="#practice" className={scss.next}>
                <span className={scss.nextIcon}>
                  <CodeIcon />
                </span>
                <div className={scss.nextInfo}>
                  <p>{practice.title || "Задачи на JavaScript"}</p>
                  <p>Текущая задача · Практика</p>
                </div>
                <span className={scss.nextArrow}>
                  <ChevronIcon />
                </span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default Hero;
