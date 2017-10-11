DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;

CREATE TABLE book
(
  id int(8) NOT NULL AUTO_INCREMENT,
  title varchar(100) NOT NULL,
  description varchar(255) NOT NULL,
  author varchar(100) NOT NULL,
  isbn varchar(20) NOT NULL,
  printYear INT,
  readAlready BIT DEFAULT FALSE,
  PRIMARY KEY (id)
);

INSERT INTO book (title, description, author, isbn, printYear) VALUES
  ("Horus Rising", "HorusHeresy", "Dan Abnett", "978-5-91181-116-2", 2006),
  ("False Gods", "HorusHeresy", "Graham McNeill", "978-5-91878-010-7", 2007),
  ("Galaxy in Flames", "HorusHeresy", "Ben Counter", "978-5-91181-476-2", 2007),
  ("Flight of the Eisenstein", "HorusHeresy", "James Swallow", "978-5-91181-765-7", 2008),
  ("Fulgrim", "HorusHeresy", "Graham McNeill", "978-5-91181-765-7", 2010),
  ("Descent of Angels", "HorusHeresy", "Mitchell Scanlon", "978-5-91181-765-7", 2010),
  ("Legion", "HorusHeresy", "Dan Abnett", "978-5-91181-765-8", 2011),
  ("Battle for the Abyss", "HorusHeresy", "Ben Counter", "978-5-91181-568-9", 2011),
  ("Mechanicum", "HorusHeresy", "Graham McNeill", "978-5-91181-568-1", 2011),
  ("Tales of Heresy", "HorusHeresy", "anthology", "978-5-91181-568-2", 2011),
  ("Fallen Angels", "HorusHeresy", "Mike Lee", "978-5-91181-568-3", 2011),
  ("A Thousand Sons", "HorusHeresy", "Graham McNeill", "978-5-91181-568-4", 2012),
  ("Nemesis", "HorusHeresy", "James Swallow", "978-5-91181-568-5", 2012),
  ("The First Heretic", "HorusHeresy", "Aaron Dembski‑Bowden", "978-5-91181-568-6", 2012),
  ("Prospero Burns", "HorusHeresy", "Dan Abnett", "978-5-91181-568-7", 1912),
  ("Age of Darkness", "HorusHeresy", "anthology", "978-5-91181-568-8", 1912),
  ("The Outcast Dead", "HorusHeresy", "Graham McNeill", "978-5-91181-568-9", 2012),
  ("Deliverance Lost", "HorusHeresy", "Gav Thorpe", "978-5-91181-568-2", 2012),
  ("Know No Fear", "HorusHeresy", "Dan Abnett", "978-5-91181-568-3", 2013),
  ("The Primarchs", "HorusHeresy", "anthology", "978-5-91181-568-4", 2013),
  ("Fear to Tread", "HorusHeresy", "James Swallow", "978-5-91181-568-5", 2013),
  ("Shadows of Treachery", "HorusHeresy", "anthology", "978-5-91181-568-6", 2012);


