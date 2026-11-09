import scss from "./Footer.module.scss";
import { CheckIcon } from "@/components/ui/icons/Icons";

const Footer = () => {
  return (
    <footer className={scss.container}>
      <div className={scss.mainContainer}>
        <div className={scss.logo}>
          <span className={scss.logoIcon}>
            <CheckIcon />
          </span>
          <span className={scss.logoText}>
            Exam<span>Do</span>
          </span>
        </div>
        <p>Тренируйся. Проверяй. Сдавай уверенно.</p>
        <div className={scss.links}>
          <a href="/#exam">Экзамен</a>
          <a href="/#practice">Практика</a>
          <span>© 2026</span>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
