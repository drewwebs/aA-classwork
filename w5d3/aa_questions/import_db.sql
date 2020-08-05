PRAGMA foreign_keys = ON;

-- dropdb questions;
-- createdb questions;
-- psql questions < data/create_tables.sql


DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Drew', 'Webster'),
  ('Donald', 'Herndon');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Drew''s Question', 'DrewDrawDrow', (SELECT id FROM users WHERE lname = 'Webster')),
  ('Donald''s Question', 'Oops', (SELECT id FROM users WHERE lname = 'Herndon')),
  ('Drew''s Second Question', 'whoops it broke again, david pls help!', (SELECT id FROM users WHERE lname = 'Webster'));

INSERT INTO
  replies (body, user_id, question_id)
VALUES
  ('correct answer: you did it wrong', 1, 2),
  ('DriwDroowDrzw', 2, 1);

INSERT INTO
  replies (body, user_id, question_id, parent_reply_id)
VALUES
  ('omg,,,, thank you so MUCH davidru!! MySQL works now!', 2, 2, (SELECT id FROM replies WHERE body = 'correct answer: you did it wrong')),
  ('np I do this actually every day', 1, 2, (SELECT id FROM replies WHERE body LIKE 'omg%'));
  

INSERT INTO
  question_follows (user_id, question_id)
VALUES 
  (1, 2),
  (2, 2),
  (1, 1);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 1),
  (2, 2);