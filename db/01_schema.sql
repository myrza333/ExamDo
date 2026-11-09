create table if not exists guests (
  id serial primary key,
  name varchar(50) not null,
  created_at timestamp not null default now()
);

create table if not exists questions (
  id serial primary key,
  topic varchar(50) not null,
  question text not null,
  answer text not null,
  wrong_answers text[] not null
);
