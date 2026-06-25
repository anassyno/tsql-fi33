drop table if exists mitarbeiter;
drop table if exists abteilung;


create table abteilung(
id int identity(1,1) primary key,
bez varchar(50)
);

create table mitarbeiter(
id int identity(1,1) primary key,
vname varchar(50),
abt INT,
foreign key (abt) references abteilung(id)
);

insert into abteilung values
('Verwaltung'),('Marketing'),('IT');

Insert into mitarbeiter values
('Johny', 1), ('Gabriella',1), ('Karl', null), ('lena', 2)


select vname, bez 
from mitarbeiter, abteilung
where abt=abteilung.id;

select m.vname,a.bez 
from mitarbeiter m
join abteilung a 
on m.abt=a.id;



--from here copied from Boris. gotta check the names
select vname, bez from mitarbeiterleft join abteilung on abt = abteilung.id

select vname, bez from mitarbeiterleft join abteilung on abt = abteilung.id

select vname, bez from mitarbeiterright join abteilung on abt = abteilung.id

select vname, bez from mitarbeiterfull outer join abteilung on abt = abteilung.id

select vname, bez from mitarbeiterleft join abteilung on abt = abteilung.id
where abteilung.id is nullselect vname, bez from mitarbeiterright 
join abteilung on abt = abteilung.idwhere mitarbeiter.id is null

select vname, bez from mitarbeiterfull 
outer join abteilung on abt = abteilung.id
where mitarbeiter.id is null or abteilung.id is null

select vname Vorname, bez Abteilungfrom mitarbeiterfull 
outer join abteilung on abt = abteilung.idwhere mitarbeiter.id is null or abteilung.id is null