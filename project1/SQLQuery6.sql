drop table if exists datum;

create table datum (
id int identity(1,1) primary key,
datum date
);

insert into datum values ('06-29-2026');
insert into datum values ('2026-06-29');
insert into datum values ('2026.06.29');
insert into datum values ('2026/06/29');



select date_format Datumsformat, date_first "Erster Wochentag", 
language Sitzungssprache 
from sys.dm_exec_sessions 
where session_id = @@spid;

select * from datum;

set dateformat mdy;
set dateformat ymd;

set language us_english;
set language us_english;

select getdate();

insert into datum values (getdate());

select year(getdate()) Jahr, month(getdate()) Monat, day(getdate()) Tag;

select year(datum) Jahr from datum ;


select day(datum) Tag, month(datum) Monat, year(datum) Jahr from datum;

insert into datum values
('2024-3-14'),
('2025-11-11'),
('2025-3-14'),
('2024-3-14');


select * from datum 
where datum.datum between '2025-01-01' and '2025-12-31';