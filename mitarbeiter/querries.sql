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
where f.bezeichnung = 'ledig' and am.bezeichnung = 'homeoffice';