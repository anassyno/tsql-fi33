use manwomanDB;
--1 Wer hat alles das gleiche Geschlecht wie die Person mit dem Nachname Lecter?
select *
from tl3_manwoman
where geschlecht =
(
select geschlecht
from tl3_manwoman
where nachname = 'Lecter'
);

--2 Welcher meiner Freunde (Nachname) hat zugeordnete Interessen?
select tl3_manwoman.nachname
from tl3_manwoman
left join tl3_mw_interessen on tl3_manwoman.mwnr = tl3_mw_interessen.mwnr
where tl3_mw_interessen.intnr is not null

select mw.nachname
from tl3_manwoman mw
where mw.mwnr in
(
select i.mwnr
from tl3_mw_interessen i
group by i.mwnr
);

--3 Wer hat keine zugeordneten Interessen?
select tl3_manwoman.nachname
from tl3_manwoman
left join tl3_mw_interessen on tl3_manwoman.mwnr = tl3_mw_interessen.mwnr
where tl3_mw_interessen.intnr is null

select mw.nachname
from tl3_manwoman mw
where mw.mwnr not in
(
select i.mwnr
from tl3_mw_interessen i
group by i.mwnr
);

--4 Welche Interessen haben meine Freunde? (nachname, Vorname, Interesse (also z. B. Lesen)) 
select mw.nachname, mw.vorname, i.inttext
from tl3_manwoman mw
join tl3_mw_interessen mi on mi.mwnr = mw.mwnr
join tl3_interessen i on i.intnr = mi.intnr;

--mit subselect
select mw.vorname, mw.nachname, i.inttext
from tl3_manwoman mw
join tl3_mw_interessen mi on mi.mwnr = mw.mwnr
join tl3_interessen i on i.intnr = mi.intnr
where mi.intnr in
(
select mi.intnr
from tl3_mw_interessen mi
);

--alternativ
SELECT mw.vorname, mw.nachname, i.inttext
FROM tl3_manwoman mw, tl3_interessen i
WHERE mw.mwnr IN 
(
    SELECT mi.mwnr 
    FROM tl3_mw_interessen mi
    WHERE mi.intnr = i.intnr
);

-- 5 Welcher meiner Freunde liest gerne?
select mw.nachname, mw.vorname
from tl3_mw_interessen mi
join tl3_interessen i on i.intnr = mi.intnr
join tl3_manwoman mw on mw.mwnr = mi.mwnr
where i.inttext = 'lesen';

--
select mw.vorname, mw.nachname
from tl3_manwoman mw
where mw.mwnr in
(
select mi.mwnr
from tl3_mw_interessen mi
where mi.intnr =
(
select i.intnr
from tl3_interessen i
where i.inttext = 'lesen'
)
);

--6 Wie viele Interessen (Anzahl) hat Frau Kron
select count(*), mw.nachname
from tl3_mw_interessen mi
join tl3_manwoman mw on mw.mwnr = mi.mwnr
group by mw.vorname, mw.nachname
having mw.nachname = 'Kron';

--7 Welcher meiner Freunde (nachname, vorname) hat die gleichen Hobbies wie Lecter?
select distinct mw.vorname, mw.nachname
from tl3_manwoman mw
join tl3_mw_interessen mi on mw.mwnr = mi.mwnr
where mi.intnr in
(
select mi.intnr
from tl3_mw_interessen mi
join tl3_manwoman mw on mw.mwnr = mi.mwnr
where mw.nachname = 'Lecter'
)
and mw.nachname != 'Lecter';

--8 Welche intnr wurden am häufigsten genannt und wie oft?  Sternchenaufgabe 
--Tipp: count und max aber ohne top
select mi.intnr
from tl3_mw_interessen mi
group by mi.intnr
having count(*) = 
(
select max(temp.Anzahl)
from
(
select mi.intnr, count(*) Anzahl
from tl3_mw_interessen mi
group by mi.intnr
)temp
);

--9 Gleiches nun mit dem inttext
select i.inttext
from tl3_interessen i
where i.intnr in
(
select mi.intnr
from tl3_mw_interessen mi
group by mi.intnr
having count(*) =
(
select max(temp.Anzahl)
from
(
select mi.intnr, count(*) Anzahl
from tl3_mw_interessen mi
group by mi.intnr
)temp
)
);

--10 Wer hat genauso viele Interessen wir die Person mit dem Nachnamen Tuck?  
--Doppel-Sternchenaufgabe
select mw.vorname, mw.nachname
from tl3_mw_interessen mi
join tl3_manwoman mw on mw.mwnr = mi.mwnr
group by mw.vorname, mw.nachname
having count(*) =
(
select count(*)
from tl3_mw_interessen mi
join tl3_manwoman mw on mw.mwnr = mi.mwnr
group by mw.nachname
having mw.nachname = 'Tuck'
);

--Sternchen extrem 
--Meine Freunde haben viele Hobbies. Ein oder mehrere Hobbies wurden am häufigsten genannt.  
--Was ist es und von wem wurde es genannt? 
--Vorgehensweise: 
--Sie müssen ermitteln welches Interesse am häufigsten genannt wurde. Vielleicht ist es eines, viel
--leicht teilen sich mehrere Interessen den ersten Platz (gleiche Anzahl an Nennungen. Wäre beispiels
--weise stricken 3-mal genannt worden, Fallschirmspringen 7-mal und kochen auch 7-mal, so würden 
--sich Fallschirmspringen und kochen den ersten Platz teilen.  
--Anschließend müssen Sie herausfinden, welche Person dieses Interesse hat. Es können auch mehrere 
--Personen sein, die sich das meistgenannte bzw. die meistgenannten Hobbies teilen. 
--Gesucht sind: 
--Menschennummer, Nachname, Vorname, Interessensnummer und Interessenstext 
--Das ganze selbstverständlich in einer Anweisung. 
select mw.mwnr, mw.nachname, mw.vorname, mi.intnr, i.inttext
from tl3_mw_interessen mi
join tl3_manwoman mw on mw.mwnr = mi.mwnr
join tl3_interessen i on i.intnr = mi.intnr
where mi.intnr in
(
select mi.intnr
from tl3_mw_interessen mi
group by mi.intnr
having count(*) =
(
select max(temp.Anzahl) 
from
(
select mi.intnr, count(*) Anzahl
from tl3_mw_interessen mi
group by mi.intnr
)temp
)
);