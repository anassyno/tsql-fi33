DROP TABLE menschlein;
DROP TABLE familienstand;


CREATE TABLE familienstand (
fid INT IDENTITY(1,1) PRIMARY KEY,
fbez VARCHAR(50)
);

CREATE TABLE menschlein (
id INT IDENTITY(1,1) ,
vname VARCHAR(20),
--nname VARCHAR(20),
fid INT,
CONSTRAINT PK_mensch PRIMARY KEY (id),
CONSTRAINT fk_mensch_familienstand FOREIGN KEY  (fid) REFERENCES familienstand(fid)
);

ALTER TABLE familienstand 
ALTER COLUMN fbez VARCHAR(60);