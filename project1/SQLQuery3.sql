INSERT INTO mein_test1 VALUES 
(1, 'Karl'),
(2, 'Klara');


SELECT * FROM mein_test1

SELECT vorname FROM mein_test1;

INSERT INTO mein_test1 (vorname) VALUES ('Jenny'), ('Johny');

INSERT INTO mein_test1 (vorname, nummer) VALUES ('Fred', 24);


CREATE TABLE mein_test2 (
nummer INT IDENTITY(1,1), 
vorname varchar(10)
);

INSERT INTO mein_test2 VALUES 
('Karl'),
('Klara');

SELECT * FROM mein_test2


CREATE TABLE mein_test3 (
id INT IDENTITY(100,2) PRIMARY KEY, 
vorname varchar(10)
);


INSERT INTO mein_test3 VALUES
('Kermit'), ('Piggiee'), ('Gonzo'),
(null), ('null'), ('Riz-zo'), ('Waldorf'), ('Waldorf');

SELECT * FROM mein_test3;
SELECT vorname FROM mein_test3;



SELECT id whatever, vorname whatever_else from mein_test3;


CREATE TABLE mein_test4 (
id int PRIMARY KEY,
vorname varchar(10)
);

SELECT * FROM mein_test4;

INSERT INTO mein_test4 VALUES 
(1, 'Karl'),
(2, 'Klara');

INSERT INTO mein_test4 VALUES
(3, 'Karl2'),
(20, 'Klara2');

DELETE FROM mein_test3 WHERE id = 108;

DELETE FROM mein_test3 WHERE vorname = 'Waldorf';

DELETE FROM mein_test3 WHERE vorname is NULL;


SELECT * FROM mein_test3;

DELETE FROM mein_test3;


DBCC CHECKIDENT ('mein_test3');
DBCC CHECKIDENT ('mein_test3', RESEED, 125);

