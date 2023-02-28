--set transaction isolation level read committed
dbcc useroptions
set transaction isolation level read uncommitted
--set transaction isolation level repeatable read
--set transaction isolation level serializable

use test
begin tran
select * from cuentas
where id=1
commit
--no se visualiza


set transaction isolation level read committed
dbcc useroptions
--set transaction isolation level read uncommitted
--set transaction isolation level repeatable read
--set transaction isolation level serializable

use test
begin tran
select * from cuentas
where id=1
commit
--no se visualiza nada

--set transaction isolation level read committed
dbcc useroptions
--set transaction isolation level read uncommitted
set transaction isolation level repeatable read
--set transaction isolation level serializable

use test
begin tran
select * from cuentas
where id=1
commit
--no se visualiza nada 

--set transaction isolation level read committed
dbcc useroptions
--set transaction isolation level read uncommitted
--set transaction isolation level repeatable read
set transaction isolation level serializable

use test	
begin tran
select * from cuentas
where id=1
commit

--no se visualiza nada y da error
