"use client";
import { FormEvent, useEffect, useState } from "react";
import { usePathname, useRouter } from "next/navigation";
import scss from "./GuestModal.module.scss";
import { ArrowIcon, CheckIcon } from "@/components/ui/icons/Icons";
import { useGetGuest } from "@/components/hooks/guests/useGetGuest";
import { useCreateGuest } from "@/components/hooks/guests/useCreateGuest";
import {
  getErrorText,
  useAdminLogin,
} from "@/components/hooks/admin/useAdminLogin";

const GuestModal = () => {
  const router = useRouter();
  const pathname = usePathname();
  const [name, setName] = useState("");
  const [password, setPassword] = useState("");
  const [step, setStep] = useState<"name" | "password">("name");
  const { data: guest, isSuccess } = useGetGuest();
  const {
    mutate: createGuest,
    isPending,
    error: createError,
  } = useCreateGuest();
  const {
    mutate: adminLogin,
    isPending: isLoginPending,
    error: loginError,
    reset: resetLogin,
  } = useAdminLogin();
  const isOpen = isSuccess && !guest && !pathname.startsWith("/admin");

  useEffect(() => {
    document.body.style.overflow = isOpen ? "hidden" : "";
  }, [isOpen]);

  if (!isOpen) return null;

  const onSubmitName = (e: FormEvent) => {
    e.preventDefault();
    if (!name.trim()) return;
    createGuest(name.trim(), {
      onSuccess: (data) => {
        if ("admin" in data) setStep("password");
      },
    });
  };

  const onSubmitPassword = (e: FormEvent) => {
    e.preventDefault();
    if (!password) return;
    adminLogin(
      { login: name.trim(), password },
      {
        onSuccess: () => {
          setPassword("");
          setStep("name");
          setName("");
          router.push("/admin");
        },
      },
    );
  };

  const onBack = () => {
    setStep("name");
    setPassword("");
    resetLogin();
  };

  if (step === "password") {
    return (
      <div className={scss.overlay}>
        <form className={scss.modal} onSubmit={onSubmitPassword}>
          <span className={scss.logo}>
            <CheckIcon />
          </span>
          <h2>Вход для админа</h2>
          <p>Введи пароль, чтобы открыть админку.</p>
          <input
            type="password"
            placeholder="Пароль"
            value={password}
            autoFocus
            autoComplete="current-password"
            onChange={(e) => setPassword(e.target.value)}
          />
          {loginError && (
            <span className={scss.error}>{getErrorText(loginError)}</span>
          )}
          <button type="submit" disabled={!password || isLoginPending}>
            {isLoginPending ? "Проверяем..." : "Войти"}
            <ArrowIcon />
          </button>
          <button type="button" className={scss.back} onClick={onBack}>
            Назад
          </button>
        </form>
      </div>
    );
  }

  return (
    <div className={scss.overlay}>
      <form className={scss.modal} onSubmit={onSubmitName}>
        <span className={scss.logo}>
          <CheckIcon />
        </span>
        <h2>Добро пожаловать в ExamDo</h2>
        <p>Регистрация не нужна. Просто напиши своё имя, и можно начинать.</p>
        <input
          type="text"
          placeholder="Твоё имя"
          value={name}
          maxLength={50}
          autoFocus
          onChange={(e) => setName(e.target.value)}
        />
        {createError && (
          <span className={scss.error}>{getErrorText(createError)}</span>
        )}
        <button type="submit" disabled={!name.trim() || isPending}>
          {isPending ? "Сохраняем..." : "Начать"}
          <ArrowIcon />
        </button>
      </form>
    </div>
  );
};

export default GuestModal;
