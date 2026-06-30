--use music;

use Mitarbeiter;

select m.nachname, m.vorname, am.bezeichnung
from mitarbeiter m
join arbeitsmodell am on am.am_id = m.am_id
order by am.bezeichnung, m.nachname, m.vorname;

select m.nachname, m.vorname, m.geburtsdatum
from mitarbeiter m
join familienstand f on f.fs_id = m.fs_id
join arbeitsmodell am on am.am_id = m.am_id
where f.bezeichnung = 'ledig' and am.bezeichnung like 'home%';

select m.nachname, m.vorname, a.bezeichnung
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id
order by a.bezeichnung, m.nachname, m.vorname;

select m.nachname, m.vorname, a.bezeichnung--, azm.bezeichnung
from mitarbeiter m
join abteilung a on m.ab_id = a.ab_id
join arbeitsmodell azm on azm.am_id = m.am_id
where azm.bezeichnung like 'teil%'
order by a.bezeichnung, m.nachname, m.vorname;

select m.nachname, m.vorname, a.bezeichnung
from mitarbeiter m, abteilung a, arbeitsmodell azm
where m.ab_id = a.ab_id and azm.am_id = m.am_id and azm.bezeichnung like 'teil%'
order by a.bezeichnung, m.nachname, m.vorname;

select m.nachname, m.vorname
from mitarbeiter m
join familienstand f on f.fs_id = m.fs_id
where f.bezeichnung = 'ledig' and m.ort like 'n%rnberg';
