select * into kuenstler from interpret;

create table kuenstlernamen (
k_name varchar(200));

INSERT INTO kuenstlernamen
SELECT name FROM interpret;

drop table kuenstlernamen;

SELECT name AS k_name INTO kuenstlernamen FROM interpret;

delete from kuenstler where i_id = 6;

select * from kuenstler;

delete from kuenstler where name = 'Adele';

delete kuenstlernamen;

select * from kuenstlernamen;
drop table if exists kuenstlernamen;

select * from INFORMATION_SCHEMA.tables;