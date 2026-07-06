create login tasso with password = 'Tas11so92';

use dba1;

create user tasso_dba_1 for login tasso;

create table table1 ( id int);

insert into table1 values (1), (2);

select * from table1;

execute as login = 'tasso'
select USER_NAME();
select SYSTEM_USER;
revert;

use dba1;

grant select on table1 to tasso_dba_1;
select * from table1;

grant insert on table1 to tasso_dba_1;
insert into table1 values (3);

grant delete on table1 to tasso_dba_1;
delete table1;

revoke delete on table1 to tasso_dba_1;

revoke select on table1 to tasso_dba_1;

insert into table1 values (23);

revoke insert on table1 to tasso_dba_1;
