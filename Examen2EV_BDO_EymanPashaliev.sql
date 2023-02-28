--1 
-- Dni tiene que tener 8 digitos y una letra al final
ALTER TABLE clientes
ADD CONSTRAINT CK_dni CHECK (DNI LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]')

--Comprueba que el cliente es mayor de 18

ALTER TABLE cliente
ADD CONSTRAINT CK_mayordeedad CHECK (DATEDIFF(yy,fechaNacimiento,GETDATE()) > 18)

-- 2 Añade una columna a vehiculos 
ALTER TABLE vehiculos
ADD TotalKilometros INT
INSERT INTO vehiculos
SELECT SUM(ISNULL(Kilometros, 0)) FROM alquileres a JOIN vehiculos v ON a.Matricula = v.Matricula
GROUP BY a.Matricula 

GO
--3 Crea una vista que muestre para todas las marcas la media de km por alquiler
CREATE VIEW MediaKM AS
SELECT AVG(Kilometros) 'MediaKM', Marca FROM alquileres a JOIN vehiculos v ON a.Matricula = v.Matricula
GROUP BY Marca
GO

--4 Vista llamada cochesnoalquilados mostrando por cada marca y modelo el numero de vehiculos no alquilados hoy
CREATE VIEW CochesNoAlquilados AS
SELECT Marca,Modelo,COUNT(a.Matricula) 'NumeroCoches' FROM alquileres a JOIN vehiculos v ON a.Matricula = v.Matricula
WHERE FechaInicial NOT LIKE GETDATE()
GROUP BY Marca, Modelo
GO

--5 duracion media alquileres y importe medio por nacionalidad
CREATE VIEW MediaAquileresNacionalidad AS
SELECT AVG(NumDias) 'DuracionMedia', AVG(v.PrecioPorDia * a.NumDias) 'ImporteMedio', c.Nacionalidad FROM alquileres a JOIN vehiculos v ON a.Matricula = v.Matricula 
JOIN clientes c ON a.DNI = c.DNI
GROUP BY c.Nacionalidad
GO
--6 Eliminar coches que tengan más de tres años o tengan mas de 50000 kms
DELETE vehiculos
WHERE DATEDIFF(yy,FechaCompra, GETDATE()) > 3

--7 Mejorar las consultas de los vehículos por marca:
--Se podría mejorar la base de datos creando un índice que ordenará las marcas de coche y así mejorar la eficiencia de búsqueda
CREATE INDEX MarcasCoche ON vehiculos(Marca)

--8 Crea una tabla BuenosClientes según lo que se pida
-----------------------------------------------------------------------------------------------
CREATE TABLE BuenosClientes(
	id_buencliente INT PRIMARY KEY(id_buencliente),
	nombcliente VARCHAR NOT NULL FOREIGN KEY REFERENCES clientes(Nombre),
	año DATETIME,
	numvecesalquila INT NOT NULL
)

SELECT 

--9 
SELECT a.Matricula, SUM(
CASE
	WHEN MONTH(a.fechaInicial) IN (7,8) THEN (NumDias * (PrecioPorDia +( 0.25 * v.PrecioPorDia)))
	ELSE NumDias * PrecioPorDia
END) 'DineroGenerado'
FROM vehiculos v JOIN alquileres a ON v.Matricula = a.Matricula
GROUP BY a.Matricula