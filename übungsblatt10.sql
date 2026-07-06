--1
create table zahlen2 (
zahl int);

--2
alter table zahlen2 
add constraint zahl_pruef
check (zahl >= 1 and zahl <= 200);

insert into zahlen2 values (300)   
insert into zahlen2 values (111)
select * from zahlen2;

--3
create table zahlen3 (
zahl int
constraint zahl_pruef_3 
check (zahl >= 1 and zahl <= 200)
);

insert into zahlen3 values (300)   
insert into zahlen3 values (111) 
select * from zahlen3;

--4
use Mitarbeiter;

drop table if exists land;
drop table if exists zeitzone;

create table zeitzone (
zonennr int primary key,
zonenbez varchar(50),
utc_offset varchar(10)
);

create table land (
landnr int primary key,
landbez varchar(30),
zonennr int,
constraint fk_la_zz foreign key (zonennr) references zeitzone(zonennr)
);


insert into zeitzone (zonennr, zonenbez, utc_offset) values 
(1,'mitteleuropäische zeit (mez)','+1'), 
(2,'brasília-zeit','-3'), 
(3,'indische standardzeit','+5,30'), 
(4,'chinesische standardzeit','+8'), 
(5,'australische ostzeit (aest)','+10'), 
(6,'pazifische zeit (z.b. vancouver)','-8'), 
(7,'eastern standard time (z.b. new york)','-5'), 
(8,'japanische standardzeit','+9'), 
(9,'südafrikanische standardzeit','+2') 

insert into land (landnr, landbez, zonennr) values 
(1,'Deutschland', 1), 
(2,'Brasilien', 2), 
(3,'Indien', 3), 
(4,'China', 4), 
(5,'Australien', 5), 
(6,'Kanada', 6), 
(7,'USA', 7), 
(8,'Japan', 8), 
(9,'Südafrika', 9) ;

alter table mitarbeiter
add mlandnr int;

alter table mitarbeiter
add constraint fk_ma_la 
foreign key (mlandnr) references land(landnr);

--5
update mitarbeiter set mlandnr = 2
where id in (6, 7);
update mitarbeiter set mlandnr = 5
where id in (16, 23, 37);
update mitarbeiter set mlandnr = 9
where id in (11, 13);
update mitarbeiter set mlandnr = 1
where mlandnr is null;

select * from mitarbeiter;

--6
select m.id 'MA-ID', m.nachname Nachname, m.vorname Vorname, l.landbez Land, zz.zonenbez Zonenbezeichnung, zz.utc_offset 'UTC-Offset'
from mitarbeiter m
join land l on m.mlandnr = l.landnr
join zeitzone zz on zz.zonennr = l.zonennr
where l.landbez not like 'Deutsch%'

