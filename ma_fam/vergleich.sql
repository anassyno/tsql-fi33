select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on m.fid = f.fid
where f.fbez = 'geschieden';

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on m.fid = f.fid
where f.fbez <> 'ledig';

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on m.fid = f.fid
where f.fid = 1;

select m.id, m.vname, f.fbez
from menschlein m
join familienstand f on m.fid = f.fid
where f.fid <= 3;

select *
from menschlein m
where m.id between 2 and 7;

select m.id, m.vname, f.fbez
from menschlein m
left join familienstand f on m.fid = f.fid
where f.fid not between 2 and 4
or f.fid is null;
--where f.fid < 2 or f.fid > 4;
--where not(f.fid >= 2 and f.fid <= 4);

select *
from menschlein m
where m.fid is not null;

select *
from menschlein m
where m.vname like '_a___';

select *
from menschlein m
where m.vname like '_a%';

select *
from menschlein m
where m.id like '_';
