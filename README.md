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
| `CORS_ORIGIN` | Адрес frontend, можно несколько через запятую |
| `ADMIN_LOGIN` | Логин админа |
| `ADMIN_PASSWORD` | Пароль админа |
| `ADMIN_SECRET` | Длинная случайная строка для подписи токенов |
| `NODE_ENV` | `production` на сервере |

### frontend

| Переменная | Описание |
| --- | --- |
| `NEXT_PUBLIC_API_URL` | Адрес backend |

## Деплой

1. **Neon** — создать проект, скопировать `DATABASE_URL`, вписать его в `backend/.env` и выполнить `npm run db:init` в папке `backend`.
2. **Render** — Web Service из этого репозитория:
   - Root Directory: `backend`
   - Build Command: `npm install --include=dev && npm run build`
   - Start Command: `npm start`
   - Health Check Path: `/health`
   - переменные: `DATABASE_URL`, `CORS_ORIGIN`, `ADMIN_LOGIN`, `ADMIN_PASSWORD`, `ADMIN_SECRET`, `NODE_ENV=production`
3. **Vercel** — проект из этого репозитория:
   - Root Directory: `frontend`
   - переменная: `NEXT_PUBLIC_API_URL` = адрес сервиса на Render
4. На Render в `CORS_ORIGIN` указать адрес сайта на Vercel.
