"use client";
import { useState } from "react";
import scss from "./Header.module.scss";
import { CheckIcon, MenuIcon, UserIcon } from "@/components/ui/icons/Icons";
import { useGetGuest } from "@/components/hooks/guests/useGetGuest";

const links = [
  { href: "/#exam", label: "Экзамен" },
  { href: "/#practice", label: "Практика" },
];

const Header = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const { data: guest } = useGetGuest();

  return (
    <header className={scss.container}>
      <div className={scss.mainContainer}>
        <a href="/" className={scss.logo} aria-label="ExamDo — на главную">
          <span className={scss.logoIcon}>
            <CheckIcon />
          </span>
          <span className={scss.logoText}>
            Exam<span>Do</span>
          </span>
        </a>

        <nav className={scss.nav}>
          {links.map((el) => (
            <a key={el.href} href={el.href}>
              {el.label}
            </a>
          ))}
        </nav>

        <div className={scss.profile}>
          {guest && (
            <div className={scss.guest}>
              <span>
                <UserIcon />
              </span>
              <p>
                {guest.name}
                <b> · Гость {guest.id}</b>
              </p>
            </div>
          )}
          <a href="/#exam" className={scss.start}>
            Начать
          </a>
        </div>

        <div className={scss.mobile}>
          {guest && <span className={scss.mobileGuest}>Гость {guest.id}</span>}
          <button
            className={scss.burger}
            aria-label="Открыть меню"
            onClick={() => setIsMenuOpen(!isMenuOpen)}
          >
            <MenuIcon />
          </button>
        </div>
      </div>

      {isMenuOpen && (
        <nav className={scss.mobileNav}>
          {guest && (
            <p className={scss.mobileName}>
              {guest.name} · Гость {guest.id}
            </p>
          )}
          {links.map((el) => (
            <a key={el.href} href={el.href} onClick={() => setIsMenuOpen(false)}>
              {el.label}
            </a>
          ))}
          <a
            href="/#exam"
            className={scss.start}
            onClick={() => setIsMenuOpen(false)}
          >
            Начать
          </a>
        </nav>
      )}
    </header>
  );
};

export default Header;
