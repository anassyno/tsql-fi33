--1. Welche Interpreten enthalten an beliebiger Stelle ein e und enden auf s

select * from interpret i
where i.name like '%e%s';

--2. Welche Titel wurden bereits in Vegas oder Fuerth gespielt, sortieren Sie bitte nach Titel auf-steigend

select t.titel, iv.datum_von, iv.datum_bis, v.ort_name 
from titel t
--join interpret i on t.interpret_id = i.i_id
join in_ver iv on iv.i_nr = t.interpret_id
join veranstaltungsort v on v.v_id = iv.v_nr
where v.ort_name in ('vegas', 'f%rth') and iv.datum_bis < getdate();

--3. Welche Titel enthalten kein a

select * from titel t
where t.titel not like '%a%';

--4. Kontrollieren Sie, wann Adele und/oder Miles Davis nach dem 30.06.2026 gebucht sind

select i.name, iv.datum_von, iv.datum_bis
from interpret i
join in_ver iv on iv.i_nr = i.i_id
where i.name in ('Adele', 'Miles Davis')
and iv.datum_bis > '2026-06-30'
order by iv.datum_von;


--continue

select getdate() Datum;

select format(getdate(), 'dd MM yyyy', 'de-DE') Heute;
select format(getdate(), 'dd MMMM yyyy', 'de-DE') Heute;

select datename(year, getdate()) Jahr,
datename(month, getdate()) Monat,
datename(week, getdate()) Woche,
datename(weekday, getdate()) Wochentag,
datename(hour, getdate()) Uhr,
datename(minute, getdate()) Minute,
datename(second, getdate()) Sekunde,
datename(millisecond, getdate()) Milli,
datename(MICROSECOND, getdate()) Mikro,
datename(nanosecond, getdate()) Nano;


