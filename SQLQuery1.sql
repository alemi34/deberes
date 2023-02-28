USE compras
SELECT * FROM Articulos
WHERE stockart<=100
ORDER BY 1 DESC;

SELECT TOP 10PERCENT descrart, preunart from Articulos
ORDER BY preunart DESC

SELECT DISTINCT stockmin from Articulos;


USE nba

SELECT * FROM dbo.jugadores

SELECT TOP 20PERCENT nombre, Altura FROM dbo.jugadores
ORDER BY Altura desc

SELECT nombre FROM dbo.jugadores 
WHERE Nombre_equipo = 'lakers'

SELECT nombre FROM dbo.jugadores 
WHERE Nombre_equipo = 'lakers' and Procedencia = 'Spain'

SELECT nombre, procedencia,Nombre_equipo FROM dbo.jugadores 
WHERE Nombre_equipo = 'lakers' and (Procedencia = 'Spain'or Procedencia = 'Slovenia')

SELECT nombre, peso*0.4535 FROM dbo.jugadores
WHERE peso BETWEEN 90/0.4535 AND 120/0.4535

SELECT nombre FROM dbo.equipos
WHERE Nombre LIKE 'R_____S'

SELECT nombre FROM dbo.equipos
WHERE Nombre LIKE'_o%'

USE compras
SELECT nombrpro FROM dbo.Proveedores
WHERE cpostpro LIKE '[34]%'

SELECT codigart FROM dbo.Articulos
WHERE preunart*1.10 < 200


USE nba
Select e.Nombre 'nombre equipo', j.Nombre FROM dbo.equipos e, dbo.jugadores j
WHERE j.peso BETWEEN 90/0.4535 AND 120/0.4535 AND e.Nombre=j.Nombre_equipo

USE compras
SELECT  nombrpro emailpro FROM proveedores
where emailpro IS NOT NULL

SELECT COUNT(codigart) AS 'numero articulos' FROM Articulos
--WHERE preunart<=200

SELECT COUNT(codigart) AS 'numero articulos' FROM Articulos
SELECT COUNT(*) AS 'numero articulos' FROM Articulos

SELECT COUNT(fecbaja) AS 'numero articulos' FROM Articulos

SELECT COUNT(DISTINCT localpro) AS 'numero articulos' FROM Proveedores

USE nba
SELECT COUNT(Nombre), Nombre_equipo FROM jugadores
WHERE Peso BETWEEN 90/0.4535 AND 120/0.4535 
GROUP BY nombre_equipo
HAVING COUNT(nombre)>2