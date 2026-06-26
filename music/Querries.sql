select * from titel;
select * from interpret;
select * from genre;


select name, titel from titel
join interpret i on interpret_id=i_id;

select i.name Band, t.titel Song, g.genre Genre from interpret i
join titel t on i.i_id=t.interpret_id
join genre g on g.g_id=t.genre_id

select i.name Band, t.titel Song, g.genre Genre from interpret i
join titel t on i.i_id=t.interpret_id
join genre g on g.g_id=t.genre_id
where g.genre in ('rock', 'reggae')
--where g.genre='rock' or g.genre='reggae'

select i.name Band, t.titel Song, g.genre Genre from interpret i
join titel t on i.i_id=t.interpret_id
join genre g on g.g_id=t.genre_id
where g.genre in ('rock', 'pop')
order by t.titel DESC

select i.name Band, t.titel Song, g.genre Genre 
from interpret i, genre g, titel t 
where i.i_id=t.interpret_id and g.g_id=t.genre_id and g.genre in ('rock', 'pop')

select i.name, v.ort_name
from interpret i, veranstaltungsort v, in_ver
where i.i_id=in_ver.i_nr and v.v_id=in_ver.v_nr

select i.name, v.ort_name
from interpret i
join in_ver on i.i_id=in_ver.i_nr
join veranstaltungsort v on v.v_id=in_ver.v_nr

select distinct i.name, g.genre
from interpret i
join titel t on t.interpret_id=i.i_id
join genre g on t.genre_id=g.g_id
--group by i.name, g.genre
order by g.genre
