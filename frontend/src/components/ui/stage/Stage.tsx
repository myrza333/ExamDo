import scss from "./Stage.module.scss";
import { ArrowIcon } from "@/components/ui/icons/Icons";

type StageProps = {
  number: number;
  title: string;
  link: {
    href: string;
    label: string;
    back?: boolean;
  };
};

const Stage = ({ number, title, link }: StageProps) => {
  return (
    <div className={scss.container}>
      <div className={scss.label}>
        <span className={scss.number}>{number}</span>
        <p>
          Этап {number}
          <span> · {title}</span>
        </p>
      </div>
      <a
        href={link.href}
        className={`${scss.link} ${link.back ? scss.back : ""}`}
      >
        <ArrowIcon />
        {link.label}
      </a>
    </div>
  );
};

export default Stage;
