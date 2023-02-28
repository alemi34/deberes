CREATE TABLE producto (
  id INT  PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio decimal(7,2)
);
delete from producto

SET XACT_ABORT ON
BEGIN TRAN
INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');
rollback


SET XACT_ABORT Off
	
Begin TRANSACTION;
INSERT INTO producto (id, nombre) VALUES (4, 'Cuarto');
SELECT * FROM producto;
ROLLBACK;

Begin Transaction
INSERT INTO producto (id, nombre) VALUES (2, 'Quinto');
INSERT INTO producto (id, nombre) VALUES (1, 'Primero');
INSERT INTO producto (id, nombre) VALUES (2, 'Segundo');
INSERT INTO producto (id, nombre) VALUES (3, 'Tercero');
commit;

Begin TRANSACTION;
CREATE TABLE fabricante (id INT );
INSERT INTO fabricante (id) VALUES (1);
SELECT * FROM fabricante;
ROLLBACK;

