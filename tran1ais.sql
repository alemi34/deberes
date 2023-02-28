/*DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
go
USE test;
CREATE TABLE cuentas (
 id INT,
 saldo DECIMAL(11,2))
 */
 /*
INSERT INTO cuentas VALUES (1, 1000);
INSERT INTO cuentas VALUES (2, 2000);
INSERT INTO cuentas VALUES (3, 0);
*/
--set transaction isolation level read committed
set transaction isolation level read uncommitted
--set transaction isolation level repeatable read
--set transaction isolation level serializable
Begin TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
select saldo from cuentas where id =1


set transaction isolation level read committed
--set transaction isolation level read uncommitted
--set transaction isolation level repeatable read
--set transaction isolation level serializable
Begin TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
select saldo from cuentas where id =1

--set transaction isolation level read committed
--set transaction isolation level read uncommitted
--set transaction isolation level repeatable read
set transaction isolation level serializable
Begin TRANSACTION;
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
select saldo from cuentas where id =1
