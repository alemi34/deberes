USE Jardineria

--4.4
--1
SELECT count(nombrecliente), e.Nombre  FROM Clientes c Right JOIN Empleados e 
ON c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
Group by nombre

SELECT c.NombreCliente, CodigoEmpleadoRepVentas FROM Clientes c LEFT JOIN Pagos p
ON c.CodigoCliente=p.CodigoCliente