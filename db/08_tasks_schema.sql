create table if not exists tasks (
  id serial primary key,
  level varchar(10) not null,
  topic varchar(50) not null,
  title text not null,
  description text not null,
  fn varchar(50) not null,
  params varchar(100) not null,
  tests json not null,
  forbidden text[] not null default '{}',
  required text[] not null default '{}',
  solution text not null,
  explanation text[] not null
);
