INSERT INTO familienstand VALUES
('ledig'),
('verheiratet'),
('geschieden');

INSERT INTO menschlein VALUES
('Lisa', 3),
('Hanni', 1),
('Eddi', 2),
('Lorenz', 2);

insert into familienstand values 
('verwitwet'),
('eingetr. Lebensgemeinschaft')

insert into menschlein values 
('Charlie',3),
('Laura',5),
('Melanie',1),
('Jack',1), 
('Daniel',1),
('Martha',null),
('Harry',null)

SELECT * FROM familienstand;
SELECT * FROM menschlein;


SELECT TABLE_NAME, COLUMN_NAME, 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME in ('familienstand', 'menschlein')

select m.vname, f.fbez 
from menschlein m , familienstand f
where m.fid = f.fid

select m.vname Vorname , f.fbez "Familienstand des Mitarbeiters" 
from menschlein m
join familienstand f on f.fid = m.fid
where vname like '____'


--SELECT 
--    t.name AS Tabelle,
--    c.name AS Spalte,
--    CASE WHEN EXISTS (SELECT 1 FROM sys.index_columns ic WHERE ic.object_id = c.object_id AND ic.column_id = c.column_id AND EXISTS (SELECT 1 FROM sys.indexes i WHERE i.object_id = ic.object_id AND i.index_id = ic.index_id AND i.is_primary_key = 1)) THEN 'PK' ELSE 'NULL' END AS PK,
--    CASE WHEN EXISTS (SELECT 1 FROM sys.foreign_key_columns fkc WHERE fkc.parent_object_id = c.object_id AND fkc.parent_column_id = c.column_id) THEN 'FK' ELSE 'NULL' END AS FK,
--    ISNULL(OBJECT_NAME(fkc.referenced_object_id) + '.' + rc.name, 'NULL') AS FK_zeigt_auf
--FROM sys.tables t
--INNER JOIN sys.columns c ON t.object_id = c.object_id
--LEFT JOIN sys.foreign_key_columns fkc ON fkc.parent_object_id = t.object_id AND fkc.parent_column_id = c.column_id
--LEFT JOIN sys.columns rc ON fkc.referenced_object_id = rc.object_id AND fkc.referenced_column_id = rc.column_id
--WHERE t.name IN ('familienstand', 'menschlein')
--ORDER BY Tabelle, Spalte;

