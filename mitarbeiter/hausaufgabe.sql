--5
use mitarbeiter;

--6
select m.nachname, m.vorname
from mitarbeiter m 
join arbeitsmodell azm on azm.am_id = m.am_id
where m.plz between '90402' and '90491' 
and azm.bezeichnung like 'home%';

--7
select nachname, vorname, adresse
from mitarbeiter 
where plz = '90402';

--8
select nachname, vorname, adresse
from mitarbeiter 
where year(geburtsdatum) > 1974;

select m.nachname, m.vorname
from mitarbeiter m 
join arbeitsmodell azm on azm.am_id = m.am_id
where azm.bezeichnung not like 'home%';

--10
select 
m.nachname Nachname,
m.vorname Vorname,
a.bezeichnung Abteilung,
azm.bezeichnung Arbeitszeitmodell,
m.geburtsdatum Geburtsdatum,
m.adresse 'Straße und Hausnummer',
m.plz PLZ,
m.ort Wohnort
from mitarbeiter m 
join abteilung a on m.ab_id = a.ab_id
join arbeitsmodell azm on m.am_id = azm.am_id;

--11
use music;

select i_id from interpret 
where interpret.name ='Adele';

select v_id from veranstaltungsort
where veranstaltungsort.ort_name like 'N%rnberg';

insert into in_ver values
(2, 1, '2025-12-28', '2025-12-28');

--also possible would be:
--insert into in_ver
--select interpret.i_id, veranstaltungsort.v_id, '2025-12-28', '2025-12-28'
--from interpret
--cross join veranstaltungsort
--where interpret.name = 'Adele' and veranstaltungsort.ort_name like 'N%rnberg';

--12
select * from veranstaltungsort
where veranstaltungsort.ort_name in ('nürnberg', 'nuernberg');

--13
delete from veranstaltungsort
where veranstaltungsort.ort_name ='nürnberg';

--14
select * from veranstaltungsort
where veranstaltungsort.ort_name in ('nürnberg', 'nuernberg');
