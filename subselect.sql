use ma_fam;

select * from menschlein m
join familienstand f on f.fid = m.fid;

select * from menschlein m
where m.fid = 
(
select fid f from menschlein m
where m.vname = 'Eddi'
)
and
vname <> 'eddi'
;

use music;

select distinct i.name
from interpret i
join titel t on i.i_id = t.interpret_id
where t.genre_id =
(
select distinct t.genre_id
from titel t
join interpret i on i.i_id = t.interpret_id
where i.name = 'coldplay'
);

select distinct i.name
from interpret i
join titel t on i.i_id = t.interpret_id
where t.genre_id in
(
select t.genre_id
from titel t
join interpret i on i.i_id = t.interpret_id
where i.name = 'linkin park'
);

use Mitarbeiter;

select m.vorname, m.nachname, am.bezeichnung
from mitarbeiter m
join arbeitsmodell am on am.am_id = m.am_id
where m.geburtsdatum =
(
select max(m.geburtsdatum)
from mitarbeiter m
);

use manwomanDB;

select i.intnr, i.inttext, count(*)
from tl3_interessen i
join tl3_mw_interessen mi on mi.intnr = i.intnr
group by i.intnr, i.inttext
having count(*) = 
(
select max(temp.A)
from
(
select mi.intnr, count(*) A
from tl3_mw_interessen mi
group by mi.intnr) temp
);

--alternative
SELECT i.intnr, i.inttext, COUNT(*) AS Anzahl_Nennungen
FROM dbo.tl3_interessen i
JOIN dbo.tl3_mw_interessen mwi ON mwi.intnr = i.intnr
GROUP BY i.intnr, i.inttext
HAVING COUNT(*) >= ALL (
SELECT COUNT(*) 
FROM dbo.tl3_mw_interessen
GROUP BY intnr
);

use Mitarbeiter;

select m.vorname, m.nachname, m.ort
from mitarbeiter m
where m.ort in 
(
select top 1 with ties ort
from mitarbeiter m
group by ort
order by count(*) desc
);


--alternativ
select m.vorname, m.nachname, m.ort
from mitarbeiter m
where m.ort in 
(
select m.ort
from mitarbeiter m
group by m.ort
having count(*) =
(
select max(temp.Anzahl)
from
(
select ort ort, count(*) Anzahl
from mitarbeiter m
group by ort
) temp
)
);


select m.vorname, m.nachname, a.bezeichnung
from mitarbeiter m
join abteilung a on a.ab_id = m.ab_id
where m.ab_id in
(
select top 1 with ties m.ab_id
from mitarbeiter m
group by m.ab_id
order by count(*) desc
)
order by a.bezeichnung;

select s.name
from skills s
where s.id in
(
select top 3 with ties sk_id
from ma_sk ms
group by sk_id
order by count (*)
);


select m.vorname, m.nachname, s.name
from mitarbeiter m
join ma_sk ms on ms.ma_id = m.id
join skills s on s.id = ms.sk_id
where ms.sk_id in
(
select top 3 with ties sk_id
from ma_sk ms
group by sk_id
order by count (*)
)
order by m.nachname, m.vorname;