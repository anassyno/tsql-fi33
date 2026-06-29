select * from titel;
select * from interpret;

select i.name, t.titel
from interpret i, titel t
where i.i_id = t.interpret_id --and i.i_id = 1;

select i.name Band, t.titel Song
from interpret i
join titel t on i.i_id = t.interpret_id
--where i.i_id = 1;

select t.titel, g.genre
from titel t, genre g
where t.genre_id = g.g_id and g.genre = 'klassik';

select t.titel, g.genre
from titel t
join genre g on g.g_id = t.genre_id
where g.genre = 'klassik';

select i.name, in_ver.datum_von, in_ver.datum_bis
from interpret i, in_ver
where i.i_id = in_ver.i_nr 
and i.name = 'miles davis' 
and '2027-07-01' between in_ver.datum_von and in_ver.datum_bis;

select i.name, in_ver.datum_von, in_ver.datum_bis, v.ort_name
from interpret i
join in_ver on i.i_id = in_ver.i_nr 
join veranstaltungsort v on v.v_id = in_ver.v_nr
where 
i.name = 'miles davis' 
--i.name like 'miles%' alternativ
and '2027-07-01' between in_ver.datum_von and in_ver.datum_bis;
--and '2027-07-01' >= in_ver.datum_von  
--and '2027-07-01' <= in_ver.datum_bis


select i.name, in_ver.datum_von, in_ver.datum_bis, v.ort_name
from interpret i
join in_ver on i.i_id = in_ver.i_nr 
join veranstaltungsort v on v.v_id = in_ver.v_nr
where 
i.name = 'miles davis' 
and ('2026-06-30' between in_ver.datum_von and in_ver.datum_bis
OR '2027-03-08' between in_ver.datum_von and in_ver.datum_bis)

select i.name, in_ver.datum_von, in_ver.datum_bis, v.ort_name
from interpret i
join in_ver on i.i_id = in_ver.i_nr 
join veranstaltungsort v on v.v_id = in_ver.v_nr
where 
i.name = 'miles davis' 
and 2026 between year(in_ver.datum_von) and year(in_ver.datum_bis);

--all togehter
select i.name, in_ver.datum_von, in_ver.datum_bis, v.ort_name
from interpret i
join in_ver on i.i_id = in_ver.i_nr 
join veranstaltungsort v on v.v_id = in_ver.v_nr
where 
i.name = 'miles davis' 
and ('2026-06-30' between in_ver.datum_von and in_ver.datum_bis
OR '2027-03-08' between in_ver.datum_von and in_ver.datum_bis
OR 2026 between year(in_ver.datum_von) and year(in_ver.datum_bis));

--select top 1 * from veranstaltungsort;

