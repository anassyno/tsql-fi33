select * from mein_test3;

update mein_test4 set vorname = 'Lukas' where id = 1;

delete from mein_test4 where vorname <> 'Karl';

insert into mein_test4 values
(15, 'Viggo'),
(20, 'Tasso'),
(5, 'Mike');

insert into mein_test4 values
(4, 'Anna'),
(2, 'null'),
(-4, null),
(25, null),
(3, 'Lukas');

insert into mein_test4 values
(25, null),
(2, 'null');

delete from mein_test4 where id < 0;

delete from mein_test4 where vorname is null or vorname = 'null';

delete from mein_test4 where vorname = 'null';

delete mein_test4;

truncate table mein_test4;

--drop table mein_test2;

--sp_rename 'mein_test3', 'kermit';

--sp_rename 'vornamen', 'mein_test3';