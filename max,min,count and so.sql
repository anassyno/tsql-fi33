use ma_fam;

select * from menschlein;

select count(*) from menschlein;

select count(menschlein.fid) Menschen from menschlein;

select count(*) from menschlein where fid is null;

select vname, count(fid) Familienstand from menschlein
group by vname;

use Mitarbeiter;

insert into mitarbeiter values
('Wagner', 'Robert', 'Bachstr 7', '90768', 'Fuerth', '1975-12-04', NULL, NULL, NULL);

select count(a.bezeichnung)
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id;

select count(*)
from mitarbeiter m
left join abteilung a on m.ab_id = a.ab_id;

select a.bezeichnung, count(*)
from mitarbeiter m
join abteilung a on a.ab_id = m.ab_id
group by a.bezeichnung;

select a.ab_id, a.bezeichnung, count(*)
from mitarbeiter m
join abteilung a on a.ab_id = m.ab_id
group by a.bezeichnung, a.ab_id;

select m.vorname, a.ab_id, a.bezeichnung, count(*)
from mitarbeiter m
join abteilung a on a.ab_id = m.ab_id
group by a.bezeichnung, a.ab_id, m.vorname;

select f.bezeichnung, count(*)
from mitarbeiter m
join familienstand f on f.fs_id = m.fs_id
group by f.bezeichnung;

select a.ab_id, a.bezeichnung, count(*) 
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id
group by a.ab_id, a.bezeichnung
HAVING COUNT(*) >3;

select f.bezeichnung, count(*)
from mitarbeiter m
join familienstand f on f.fs_id = m.fs_id
group by f.bezeichnung
having count(*)>=8;

select a.bezeichnung, count(*)
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id
group by a.bezeichnung
having a.bezeichnung in ('IT', 'Logistik');

--in this case is where a bit faster because having counts everything and then shows the ones asked for
--where uses the case first
select a.bezeichnung, count(*)
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id
where a.bezeichnung in ('IT', 'Logistik')
group by a.bezeichnung;

select count(*)
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id
where a.bezeichnung in ('IT', 'Logistik');

select a.bezeichnung, count(*)
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id
group by a.bezeichnung
having count(*) > 3
order by count(*) DESC;

use whatever_db_1;

create table aggregat_test(zahl INT);

insert into aggregat_test values
(12),
(127),
(287),
(2),
(100),
(null);

select * from aggregat_test;
select count(zahl) from aggregat_test;
select avg(zahl) from aggregat_test;
select min(zahl) from aggregat_test;
select max(zahl) from aggregat_test;
select sum(zahl) from aggregat_test;
select avg(zahl)/count(zahl) from aggregat_test;

use Mitarbeiter;

select max(temp.Anzahl)
from
(
select f.bezeichnung, count(*) Anzahl
from mitarbeiter m
join familienstand f on f.fs_id = m.fs_id
group by f.bezeichnung
) temp;

use whatever_db_1;

select * from aggregat_test;

insert into aggregat_test values (-5);

select top 3 zahl from aggregat_test
order by zahl;

delete from aggregat_test where zahl = -5;

select top 3 zahl from aggregat_test
where zahl is not null
order by zahl;

insert into aggregat_test values (12);

select top 3 with ties zahl from aggregat_test
order by zahl;

insert into aggregat_test values (207),(100);

insert into aggregat_test values (287),(100);


select top 5 with ties zahl from aggregat_test
order by zahl desc;
