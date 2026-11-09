# ExamDo

Бесплатный тренажёр для подготовки к экзамену по веб-разработке.

- Этап 1 — теория: 15 случайных вопросов из 250.
- Этап 2 — практика: 5 задач на JavaScript (100 лёгких и 60 сложных).
- Без регистрации: гость вводит имя и получает номер.
- Админка `/admin` — список гостей и удаление.

## Структура

```
frontend/   Next.js + TypeScript + SCSS
backend/    Express + TypeScript + PostgreSQL
db/         SQL: таблицы, вопросы и задачи
```

## Локальный запуск

```bash
cd backend
cp .env.example .env
npm install
npm run db:init
npm run dev
```

```bash
cd frontend
npm install
npm run dev
```

Frontend: http://localhost:3000, backend: http://localhost:5000.

## Переменные окружения

### backend

| Переменная | Описание |
| --- | --- |
| `DATABASE_URL` | Строка подключения к PostgreSQL (Neon). Если пусто — используются `DB_*` |
| `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME` | Локальная база |
| `CORS_ORIGIN` | Адрес frontend для прямых запросов (при переадресации через /api не нужен) |
| `ADMIN_LOGIN` | Логин админа |
| `ADMIN_PASSWORD` | Пароль админа |
| `ADMIN_SECRET` | Длинная случайная строка для подписи токенов |
| `NODE_ENV` | `production` на сервере |

### frontend

| Переменная | Описание |
| --- | --- |
| `API_URL` | Адрес backend. Сайт обращается к `/api/...`, а Next.js переадресует запросы на этот адрес |

## Деплой: GitHub + Vercel + Neon

Один репозиторий, два проекта на Vercel и база на Neon.

1. **Neon** — создать проект, скопировать строку подключения (pooled), вписать её в `backend/.env` как `DATABASE_URL` и выполнить `npm run db:init` в папке `backend`.
2. **Vercel, проект backend** — импортировать этот репозиторий:
   - Root Directory: `backend`
   - Framework Preset: Other
   - переменные: `DATABASE_URL`, `ADMIN_LOGIN`, `ADMIN_PASSWORD`, `ADMIN_SECRET`, `NODE_ENV=production`
   - проверка: `https://<адрес-backend>/health` отвечает `{"message":"ok"}`
3. **Vercel, проект frontend** — импортировать этот же репозиторий ещё раз:
   - Root Directory: `frontend`
   - Framework Preset: Next.js
   - переменная: `API_URL` = адрес проекта backend, например `https://examdo-api.vercel.app`
4. Адрес сайта — адрес проекта frontend. Его можно вписать в поле Website в блоке About репозитория на GitHub.
