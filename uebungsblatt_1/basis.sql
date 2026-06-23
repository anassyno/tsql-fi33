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
id INT IDENTITY(1,1) PRIMARY KEY,
nachname VARCHAR(20),
vorname VARCHAR(20),
adresse VARCHAR(20),
plz CHAR(5),
ort VARCHAR(20),
geburtsdatum DATE,
fs_id INT,
ab_id INT,
am_id CHAR(2),
FOREIGN KEY (fs_id) REFERENCES familienstand(fs_id),
FOREIGN KEY (ab_id) REFERENCES abteilung(ab_id),
FOREIGN KEY (am_id) REFERENCES arbeitsmodell(am_id)
);

--DBCC CHECKIDENT ('familiens', RESEED, 0);

--SELECT * FROM familienstand;