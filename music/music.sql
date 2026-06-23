CREATE TABLE genre(gen_id INT IDENTITY(1,1) PRIMARY KEY,genre VARCHAR(30));

CREATE TABLE interpret(int_id INT IDENTITY(1,1) PRIMARY KEY,name VARCHAR(200));
CREATE TABLE titel(tit_id INT IDENTITY(1,1) PRIMARY KEY,titel VARCHAR(200),interpret_id INT,genre_id INT,FOREIGN KEY (interpret_id) REFERENCES interpret(int_id),FOREIGN KEY (genre_id) REFERENCES genre(gen_id));


