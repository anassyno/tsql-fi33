--DROP TABLE mitarbeiter;
--DROP TABLE familienstand;
--DROP TABLE abteilung;
--DROP TABLE arbeitsmodell;


CREATE TABLE familienstand (
fs_id INT IDENTITY(1,1) PRIMARY KEY,
bezeichnung VARCHAR(50)
);

CREATE TABLE abteilung (
ab_id INT IDENTITY(1,1) PRIMARY KEY,
bezeichnung VARCHAR(20)
);

CREATE TABLE arbeitsmodell (
am_id CHAR(2) PRIMARY KEY,
bezeichnung VARCHAR(20)
);

CREATE TABLE mitarbeiter (
id INT IDENTITY(1,1),
nachname VARCHAR(20),
vorname VARCHAR(20),
adresse VARCHAR(20),
plz CHAR(5),
ort VARCHAR(20),
geburtsdatum DATE,
fs_id INT,
ab_id INT,
am_id CHAR(2),
CONSTRAINT pk_ma_id PRIMARY KEY (id),
CONSTRAINT fk_ma_fs FOREIGN KEY (fs_id) REFERENCES familienstand(fs_id),
CONSTRAINT fk_ma_ab FOREIGN KEY (ab_id) REFERENCES abteilung(ab_id),
CONSTRAINT fk_ma_am FOREIGN KEY (am_id) REFERENCES arbeitsmodell(am_id)
);

CREATE TABLE skills (
id INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(25)
);

CREATE TABLE ma_sk (
ma_id INT,
sk_id INT,
CONSTRAINT fk_ma_id FOREIGN KEY (ma_id) REFERENCES mitarbeiter (id),
CONSTRAINT fk_sk_id FOREIGN KEY (sk_id) REFERENCES skills (id),
CONSTRAINT pk_ma_sk PRIMARY KEY (ma_id, sk_id)
);

--DBCC CHECKIDENT ('familiens', RESEED, 0);

--SELECT * FROM familienstand;

--SELECT * FROM skills;

--SELECT * FROM ma_sk;
--DROP TABLE skills;
--DROP TABLE ma_sk;
