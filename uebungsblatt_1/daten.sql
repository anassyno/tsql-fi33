INSERT INTO familienstand VALUES
('ledig'),
('verheiratet'),
('geschieden'),
('verwitert'),
('eingetr. Lebensgemein-schaft');

INSERT INTO abteilung VALUES
('Personal'),
('Vertrieb'),
('Marketing'),
('Buchhaltung'),
('IT'),
('Entwicklung'),
('Produktion'),
('Einkauf'),
('Logistik'),
('Verwaltung');

INSERT INTO arbeitsmodell VALUES
('vz', 'Vollzeit'),
('ho', 'HomeOffice'),
('mm', 'Minijob'),
('tz', 'Teilzeit');

INSERT INTO mitarbeiter VALUES
('Fahrer', 'Bob', 'Mozartstr. 7', '90768', 'Fuerth','1972-11-02' ,5 ,7 ,'vz'),
('Platz', 'Alexander', 'Lessingstr. 72', '91054', 'Erlangen','1955-08-01' ,2 ,7 ,'vz'),
('Kreuz', 'Andreas', 'Ringstr. 40',	'90765', 'Fuerth', '1974-04-26', 3,	2, 'ho'), 
('Geber', 'Ann', 'Schillerstr. 25', '90762', 'Fuerth', '1987-03-17', 3,	4, 'vz'),
('Zug', 'Ann', 'Lindenweg 12', '90411', 'Nuernberg', '1996-03-20',	5, 2, 'mm'),
('Bolika', 'Anna', 'Bahnhofstr. 142', '90425', 'Nuernberg', '1981-04-20', 5, 6, 'vz'), 
('Nass', 'Anna', 'Dorfstr. 18', '90409', 'Nuernberg', '1959-02-10', 2, 5, 'ho'),
('Theke', 'Anna', 'Kirchplatz 60', '91052', 'Erlangen', '1964-01-23', 4, 5, 'tz'),
('Höhle', 'Axel', 'Mühlgasse 94', '90766', 'Fuerth', '1969-08-04', 3, 6, 'vz'),
('Diener', 'Bernhard', 'Mühlgasse 69', '90763', 'Fuerth', '1961-05-28', 5, 3, 'vz');

SELECT * FROM mitarbeiter;