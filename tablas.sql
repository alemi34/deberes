use prueba 
USE PruebaBD;
GO
IF OBJECT_ID('t2') IS NOT NULL
    DROP TABLE t2;
GO
IF OBJECT_ID('t1') IS NOT NULL
    DROP TABLE t1;
GO
CREATE TABLE t1
    (col1 INT NOT NULL PRIMARY KEY,
	Col2 int);
CREATE TABLE t2
    (cola INT NOT NULL Primary KEY REFERENCES t1(col1),
	colb int);

----------------------------------------------------------
GO
INSERT INTO t1 VALUES (1,0)
INSERT INTO t1 VALUES (2,0);
INSERT INTO t1 VALUES (3,0);
INSERT INTO t1 VALUES (4,0);
GO

BEGIN TRANSACTION;
INSERT INTO t2 VALUES (1,10);
INSERT INTO t2 VALUES (20,20); -- Foreign key error.
INSERT INTO t2 VALUES (3,30);
COMMIT TRANSACTION;

-----------------------------------------------------------
select * from t2

-----------------------------------------------------------

DELETE FROM t2;
GO
SET XACT_ABORT ON;
GO
BEGIN TRANSACTION;
INSERT INTO t2 VALUES (1,10);
INSERT INTO t2 VALUES (20,20); -- Foreign key error.
INSERT INTO t2 VALUES (3,30);
COMMIT TRANSACTION;

GO

------------------------------------------------------------------
IF OBJECT_ID('ALUMNOS') IS NOT NULL
   DROP TABLE ALUMNOS
GO
CREATE TABLE ALUMNOS (ID INT PRIMARY KEY, NOMBRE VARCHAR(30),
                       FECHA DATETIME,EDAD INT
                       CHECK (EDAD >=11 AND EDAD <=18))
GO
--Utilizando TRY and CATCH Realiza un control de errores al insertar el siguiente registro:

   begin try
   INSERT INTO ALUMNOS VALUES (2,'JULIAN','20100101',3)
   end try 
   begin catch 
   print error_number()
   print ERROR_SEVERITY()
   print ERROR_STATE()
   print ERROR_MESSAGE()
   end catch

   ------------------------------------------------------------
   begin try
   begin tran 
   INSERT INTO ALUMNOS VALUES (2,'ALDO','20100101',17)                       
   INSERT INTO ALUMNOS VALUES (1,'VICTOR','20100101',18)                       
   INSERT INTO ALUMNOS VALUES (3,'JUAN','20100101',3)
   commit tran
   end try

   begin catch
   print error_number()
   print ERROR_SEVERITY()
   print ERROR_STATE()
   print ERROR_MESSAGE()
   rollback tran
   end catch


   SET XACT_ABORT ON;
GO
   begin tran 
   INSERT INTO ALUMNOS VALUES (2,'ALDO','20100101',17)                       
   INSERT INTO ALUMNOS VALUES (1,'VICTOR','20100101',18)                       
   INSERT INTO ALUMNOS VALUES (3,'JUAN','20100101',3)
   commit tran return

