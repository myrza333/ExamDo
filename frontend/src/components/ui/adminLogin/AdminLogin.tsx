"use client";
import { FormEvent, useState } from "react";
import scss from "./AdminLogin.module.scss";
import { ArrowIcon, CheckIcon } from "@/components/ui/icons/Icons";
import {
  getErrorText,
  useAdminLogin,
} from "@/components/hooks/admin/useAdminLogin";

const AdminLogin = () => {
  const [login, setLogin] = useState("");
  const [password, setPassword] = useState("");
  const { mutate: adminLogin, isPending, error } = useAdminLogin();

  const onSubmit = (e: FormEvent) => {
    e.preventDefault();
    if (!login.trim() || !password) return;
    adminLogin(
      { login: login.trim(), password },
      { onSuccess: () => setPassword("") },
    );
  };

  return (
    <div className={scss.container}>
      <form className={scss.form} onSubmit={onSubmit}>
        <span className={scss.logo}>
          <CheckIcon />
        </span>
        <h1>Вход для админа</h1>
        <p>Доступ только для администратора ExamDo.</p>
        <input
          type="text"
          placeholder="Логин"
          value={login}
          autoComplete="username"
          autoFocus
          onChange={(e) => setLogin(e.target.value)}
        />
        <input
          type="password"
          placeholder="Пароль"
          value={password}
          autoComplete="current-password"
          onChange={(e) => setPassword(e.target.value)}
        />
        {error && <span className={scss.error}>{getErrorText(error)}</span>}
        <button type="submit" disabled={!login.trim() || !password || isPending}>
          {isPending ? "Проверяем..." : "Войти"}
          <ArrowIcon />
        </button>
      </form>
    </div>
  );
};

export default AdminLogin;
