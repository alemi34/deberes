--nombre de los jugadores que juegan en la division shout 
USE nba
SELECT Nombre,Nombre_equipo FROM jugadores 
WHERE Nombre_equipo IN(SELECT Nombre_equipo FROM equipos WHERE Division like 'SouthEast')

SELECT Peso, Nombre FROM jugadores
WHere peso>= ALL(select peso FROM jugadores)

USE Jardineria
SELECT NombreCliente, LimiteCredito from Clientes
WHERE LimiteCredito >= ALL(SELECT LimiteCredito FROM Clientes )

SELECT Nombre, Apellido1, Puesto FROM Empleados
WHERE CodigoEmpleado not in (SELECT CodigoEmpleadoRepVentas FROM Clientes)
--4.8
--1
SELECT Nombre FROM Productos
Where PrecioVenta >= ALL(SELECT PrecioVenta FROM PRODUCTOS)
--2
SELECT nombre FROM Productos
Where CodigoProducto in(Select CodigoProducto FROM DetallePedidos WHERE Cantidad = (SELECT MAX(Cantidad) FROM DetallePedidos ))
--3
SELECT NombreCliente,LimiteCredito FROM Clientes
Where LimiteCredito>(select sum(cantidad) FROM pagos WHERE Pagos.CodigoCliente=Clientes.CodigoCliente group by CodigoCliente)

SELECT NombreCliente CodigoCliente, LimiteCredito FROM  Clientes
WHERE LimiteCredito > (SELECT sum(cantidad) FROM pagos group by CodigoCliente)

SELECT SUM(cantidad) FROM Pagos
group by CodigoCliente
--AND CodigoCliente=(SELECT CodigoCliente FROM Pagos)
--4
SELECT Nombre,cantidadEnStock from Productos
where CantidadEnStock=(SELECT MAX(cantidadEnStock) FROM Productos)or CantidadEnStock=(SELECT MIN(cantidadEnStock) FROM Productos)


--consultas correlativas
USE NBA
SELECT division FROM equipos
WHERE Nombre IN (SELECT Nombre_equipo From jugadores WHERE Procedencia ='Spain') 

SELECT division FROM equipos
WHERE EXISTS(SELECT Nombre_equipo FROM jugadores where equipos.Nombre=jugadores.Nombre_equipo AND Procedencia='Spain')

--nombre jugadores cuyo peso es mayor que el peso medio

SELECT Nombre From jugadores h
Where peso > (select AVG(peso)from jugadores e
WHERE h.Nombre_equipo=e.Nombre_equipo)

SELECT Nombre From jugadores h
Where peso > (select AVG(peso)from jugadores e
WHERE h.Nombre_equipo IN (SELECT Nombre_equipo FROM jugadores WHERE Nombre_equipo='76ers')) AND h.Nombre_equipo='76ers'

--contar por equipos lo anterior 

SELECT count(Nombre), Nombre_equipo From jugadores h
Where peso > (select AVG(peso)from jugadores e
WHERE h.Nombre_equipo IN (SELECT Nombre_equipo FROM jugadores WHERE e.Nombre_equipo=h.Nombre_equipo)) 
GROUP by Nombre_equipo
