use whatever_db_1;

insert into aggregat_test values (2);

select top 3 with ties zahl from aggregat_test
order by zahl;

update aggregat_test set zahl = 1 where zahl is null;

select top 3 with ties zahl from aggregat_test
order by zahl;

use music;

select g.genre Genre, count(t.titel) 'Anzahl Songs'
from genre g
join titel t on t.genre_id = g.g_id
group by g.genre;

select i.name, count(t.titel) 'Anzahl Songs'
from interpret i
join titel t on i.i_id = t.interpret_id
group by i.name;

select i.name, count(t.titel) Songs
from interpret i
join titel t on t.interpret_id = i.i_id
group by i.name
having count(t.titel) > 6
order by i.name;

select i.name, min(iv.datum_von), v.ort_name
from interpret i
join in_ver iv on iv.i_nr = i.i_id
join veranstaltungsort v on v.v_id = iv.v_nr
group by i.name, v.ort_name
order by i.name;

use Mitarbeiter;

select f.bezeichnung, count(m.fs_id)
from familienstand f
join mitarbeiter m on m.fs_id = f.fs_id
group by f.bezeichnung;



select top 1 m.id, m.nachname, m.vorname, m.geburtsdatum, azm.bezeichnung
from mitarbeiter m
join arbeitsmodell azm on azm.am_id = m.am_id
order by m.geburtsdatum desc;

select a.bezeichnung, count(m.id)
from mitarbeiter m
join abteilung a on a.ab_id = m.ab_id
group by a.bezeichnung;

select top 1 with ties a.bezeichnung, count(m.id) 
from mitarbeiter m
join abteilung a on a.ab_id = m.ab_id
group by a.bezeichnung
order by count(m.id) desc;

select m.nachname, m.vorname, count(ms.sk_id)
from mitarbeiter m
join ma_sk ms on ms.ma_id=m.id
group by m.nachname, m.vorname
having count(ms.sk_id)>2;

select top 1 with ties s.name, count(ms.ma_id)
from skills s
join ma_sk ms on ms.sk_id = s.id
group by s.name
order by count(ms.ma_id) desc;

use manwomanDB;

drop table if exists tl3_mw_interessen;
drop table if exists tl3_manwoman;
drop table if exists tl3_interessen;

/*
Tabellen anlegen
tl3_interessen
tl3_manwoman
tl3_mw_interessen
*/
set dateformat dmy;

CREATE TABLE tl3_manwoman
(
mwnr integer primary key,
nachname varchar(30) not null,
vorname varchar(30),
geschlecht char(1),
email varchar(60),
gebdatum date
);

CREATE TABLE tl3_interessen
(
intnr integer primary key,
inttext varchar(30)
);

CREATE TABLE tl3_mw_interessen
(
mwnr integer,
intnr integer,
foreign key (intnr) references tl3_interessen(intnr),
foreign key (mwnr) references tl3_manwoman(mwnr),
primary key (mwnr, intnr)
);

-- nummer,nachname,vorname,geschlecht,email,gebdat
insert into tl3_manwoman values
(1,'Lecter','Hannibal','m','hunger@braini.de','17.12.1954'),
(02,'Pett','Brad','m','mrjolie@angelina.com','03.05.1965'),
(03,'Walker','Jonny','m','prost@feierlaune.net','07.06.1966'),
(04,'Daniels','Jackomo','m','casanova@kloster.de','01.03.1991'),
(05,'Blond','James','m','goldfinger@agent.com','01.03.1985'),
(06,'Hari','Martha','w','spion@ichsehdich.de','18.08.1965'),
(07,'Spass','Wilma','w','wilma,spass@arbeit.com','13.04.1972'),
(08,'Tuck','Tina','w','gacker@entenhausen.com','03.08.1966'),
(09,'Darling','Claire','w','area11@zelle17.net','11.11.1977'),
(10,'Kron','Maria','w','maria-kron@getraenkemarkt.com','02.02.1970'),
(11,'NFurter','Frank','m','franky@transilvania.com','31.10.1988'),
(12,'Maus','Mini','w','mausefalle@zugeschnappt.de','04.6.1977');
--Tanja Lynen 2026/02/12 Seite 236 von 252  DAS WAR KEIN KOMMENTAR
-- nr, interesse
insert into tl3_interessen values
(1,'lesen'),
(2,'ausgehen'),
(3,'schwimmen'),
(4,'tanzen'),
(5,'kochen'),
(6,'programmieren'),
(7,'singen'),
(8,'Filme'),
(9,'reisen'),
(10,'fotografieren'),
(11,'malen'),
(12,'heimwerkern');
-- mensch,interesse
insert into tl3_mw_interessen values
(1,1),(1,5),(1,9),
(2,4),(2,2),(2,9),
(3,1),(3,2),(3,12),
(4,4),(4,2),(4,10),
(5,3),(5,8),(5,9),(5,2),(5,4),--(5,8),
(6,1),(6,11),(6,7),
(7,5),(7,12),
(8,8),(8,4),(8,2),(8,9),
(9,1),(9,2),(9,5),(9,9),
(10,3),(10,8),(10,9),(10,12);
/*
tabellen droppen
drop table tl3_mw_interessen;
drop table tl3_manwoman;
drop table tl3_interessen;
*/

select i.intnr, count(mi.mwnr)
from tl3_interessen i
join tl3_mw_interessen mi on i.intnr = mi.intnr
group by i.intnr
order by count(mi.mwnr);

select top 3 mw.vorname, mw.mwnr
from tl3_manwoman mw
order by mw.mwnr desc;

select top 1 with ties i.intnr, count(mi.mwnr)
from tl3_interessen i
join tl3_mw_interessen mi on i.intnr = mi.intnr
group by i.intnr
order by count(mi.mwnr) desc;

select top 1 i.intnr, i.inttext , count(mi.mwnr)
from tl3_interessen i
join tl3_mw_interessen mi on i.intnr = mi.intnr
group by i.intnr, i.inttext
order by count(mi.mwnr) desc;