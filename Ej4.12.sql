USE Jardineria
--2. El importe medio de los pedidos de la BBDD jardinería. 
SELECT AVG(Importe) AS Importe_medio FROM 
(SELECT SUM(PrecioUnidad * Cantidad) AS Importe, CodigoPedido FROM DetallePedidos 
GROUP BY CodigoPedido) AS tabala1;

USE nba
--3. Un listado con el número de partidos ganados por los equipos de la NBA. 
SELECT Nombre, COUNT(Nombre) AS Partidos_ganados FROM partidos p JOIN equipos e 
ON (p.equipo_local=e.Nombre AND puntos_local > puntos_visitante) 
OR (p.equipo_visitante=e.Nombre AND puntos_local < puntos_visitante) 
GROUP BY Nombre;

--4. La media de partidos ganados por los equipos del oeste.
SELECT AVG(Partidos_ganados) FROM 
(SELECT Nombre, COUNT(Nombre) AS Partidos_ganados, Conferencia FROM partidos p JOIN equipos e 
ON (p.equipo_local=e.Nombre AND puntos_local > puntos_visitante) 
OR (p.equipo_visitante=e.Nombre AND puntos_local < puntos_visitante) 
GROUP BY Nombre, Conferencia) AS tabla1
WHERE Conferencia='WEST';

USE Jardineria
--5 ¿Cuál es el pedido más caro del empleado que más clientes tiene?
SELECT CodigoPedido FROM Pedidos p join Clientes c on p.CodigoCliente=c.CodigoCliente 
join Empleados e on c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
group by e.Nombre, p.CodigoPedido, e.CodigoEmpleado
having e.CodigoEmpleado in 
(SELECT CodigoEmpleadoRepVentas FROM Clientes c group by CodigoEmpleadoRepVentas having count(c.CodigoCliente)>= ALL 
(SELECT COUNT(c.codigoCliente) FROM Clientes group by CodigoEmpleadoRepVentas))