--Pr�ctica 4.2: Consultas simples con la BBDD jardiner�a
USE Jardineria;

--Sacar el c�digo de oficina y la ciudad donde hay oficinas
SELECT CodigoOficina, Ciudad FROM Oficinas;

--Sacar cu�ntos empleados hay en la compa��a
SELECT COUNT(CodigoEmpleado) AS Cantidad_empleados FROM Empleados;

--Sacar cu�ntos clientes tiene cada pa�s
SELECT Pais, COUNT(CodigoCliente) AS Cantidad_clientes FROM Clientes GROUP BY Pais;

--Sacar cu�l fue el pago medio en 2009 (pista: Usar la funci�n YEAR)
SELECT AVG(Cantidad) AS Media_pagos FROM Pagos WHERE YEAR(FechaPago) = 2009;

--Sacar cu�ntos pedidos est�n en cada estado ordenado descendente por el n�mero de pedidos.
SELECT Estado, COUNT(CodigoPedido) AS Cantidad_pedidos FROM Pedidos GROUP BY Estado ORDER BY COUNT(CodigoPedido) DESC;

--Sacar el precio del producto m�s caro y del m�s barato
SELECT MAX(PrecioVenta) AS Producto_mas_caro, MIN(PrecioVenta) AS Producto_mas_barato FROM Productos;


--Pr�ctica 4.7: Consultas simples con la BBDD jardiner�aUSE Jardineria;--Sacar la ciudad y el tel�fono de las oficinas de Estados Unidos
SELECT Ciudad, Telefono FROM Oficinas WHERE Pais = 'EEUU';

--Sacar el nombre, los apellidos y el email de los empleados a cargo de Alberto Soria
SELECT Nombre, Apellido1, Apellido2, Email FROM Empleados WHERE CodigoJefe = (SELECT CodigoEmpleado FROM Empleados WHERE Nombre = 'Alberto' AND Apellido1 = 'Soria');

--Sacar el cargo, nombre, apellidos y email del jefe de la empresa
SELECT Puesto, Nombre, Apellido1, Apellido2, Email FROM Empleados WHERE CodigoJefe IS NULL;

--Sacar el nombre, apellidos y cargo de aquellos que no sean representantes de ventas
SELECT Nombre, Apellido1, Apellido2, Puesto FROM Empleados WHERE puesto != 'Representante Ventas';

--Sacar el n�mero de clientes que tiene la empresa
SELECT COUNT(CodigoCliente) AS Cantidad_clientes FROM Clientes;

--Sacar el nombre de los clientes espa�oles
SELECT NombreCliente FROM Clientes WHERE Pais IN ('Espa�a', 'Spain');

--Sacar cu�ntos clientes tiene cada pa�s
SELECT Pais, COUNT(CodigoCliente) AS Cantidad_clientes FROM Clientes GROUP BY Pais;

--Sacar cu�ntos clientes tiene la ciudad de Madrid
SELECT COUNT(CodigoCliente) AS Clientes_madrid FROM Clientes WHERE Ciudad = 'Madrid';

--Sacar cu�ntos clientes tienen las ciudades que empiezan por M
SELECT COUNT(CodigoCliente) AS Clientes_ciudades_empiezan_por_M FROM Clientes WHERE Ciudad LIKE 'M%';

--Sacar el c�digo de empleado y el n�mero de clientes al que atiende cada representante de ventas
SELECT CodigoEmpleadoRepVentas, COUNT(CodigoCliente) AS Numero_clientes FROM Clientes GROUP BY CodigoEmpleadoRepVentas;

--Sacar el n�mero de clientes que no tiene asignado representante de ventas
SELECT COUNT(CodigoCliente) AS Clientes FROM Clientes WHERE CodigoEmpleadoRepVentas IS NULL;

--Sacar cu�l fue el primer y �ltimo pago que hizo alg�n cliente
SELECT MIN(FechaPago) AS Primer_pedido, MAX(FechaPago) AS Ultimo_pedido FROM Pagos;

--Sacar el c�digo de cliente de aquellos clientes que hicieron pagos en 2008
SELECT DISTINCT CodigoCliente FROM Pagos WHERE YEAR(FechaPago) = 2008;

--Sacar los distintos estados por los que puede pasar un pedido
SELECT DISTINCT Estado FROM Pedidos;

--Sacar el n�mero de pedido, c�digo de cliente, fecha requerida y fecha de entrega de los pedidos que no han sido entregados a tiempo
SELECT CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega FROM Pedidos WHERE FechaEntrega > FechaEsperada;

--Sacar cu�ntos productos existen en cada l�nea de pedido
SELECT  NumeroLinea, COUNT(DISTINCT CodigoProducto) AS Cantidad FROM DetallePedidos GROUP BY NumeroLinea;

--Sacar un listado de los 20 c�digos de productos m�s pedidos ordenado por cantidad pedida
SELECT TOP 20 CodigoProducto, SUM(Cantidad) AS Cantidad FROM DetallePedidos GROUP BY CodigoProducto ORDER BY SUM(Cantidad) DESC;

--Sacar el n�mero de pedido, c�digo de cliente, fecha requerida y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos d�as antes de la fecha requerida
SELECT CodigoPedido, CodigoCliente, FechaEsperada, FechaEntrega FROM Pedidos WHERE DATEDIFF(d,FechaEntrega, FechaEsperada) >= 2;

--Sacar la facturaci�n que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. NOTA: La base imponible se calcula sumando el coste del producto por el n�mero de unidades vendidas
--El IVA, es el 18 % de la base imponible, y el total, la suma de los dos campos anteriores
SELECT SUM(Cantidad * PrecioUnidad) AS Base_importe, SUM(Cantidad * PrecioUnidad * 0.18) AS IVA, SUM(Cantidad * PrecioUnidad * 1.18) AS Total FROM DetallePedidos;

--Sacar la misma informaci�n que en la pregunta anterior, pero agrupada por c�digo de producto filtrada por los c�digos que empiecen por FR
SELECT CodigoProducto, SUM(Cantidad * PrecioUnidad) AS Base_importe, SUM(Cantidad * PrecioUnidad * 0.18) AS IVA, SUM(Cantidad * PrecioUnidad) + SUM(Cantidad * PrecioUnidad * 0.18) AS Total FROM DetallePedidos WHERE CodigoProducto LIKE 'FR%' GROUP BY CodigoProducto;


--Pr�ctica 4.3: Subconsultas con la BBDD jardiner�a
USE Jardineria;

--Obtener el nombre del cliente con mayor l�mite de cr�dito
SELECT NombreCliente FROM Clientes WHERE LimiteCredito = (SELECT MAX(LimiteCredito) FROM Clientes);--Obtener el nombre, apellidol y cargo de los empleados que no representen a ning�n cliente.SELECT Nombre, Apellido1, Puesto FROM Empleados WHERE CodigoEmpleado NOT IN (SELECT CodigoEmpleadoRepVentas FROM Clientes);--Pr�ctica 4.8: Subconsultas con la BBDD jardiner�a
USE Jardineria

--Obtener el nombre del producto m�s caro.
SELECT Nombre FROM Productos WHERE PrecioVenta = (SELECT MAX(PrecioVenta) FROM Productos);

--Obtener el nombre del producto del que m�s unidades se hayan vendido en un mismo pedido
SELECT Nombre FROM Productos WHERE CodigoProducto = (SELECT CodigoProducto FROM DetallePedidos WHERE cantidad = (SELECT MAX(Cantidad) FROM DetallePedidos))

--Los clientes cuya l�nea de cr�dito sea mayor que los pagos que hayan realizado
SELECT NombreCliente FROM Clientes WHERE LimiteCredito > (SELECT SUM(Cantidad) FROM Pagos WHERE Pagos.CodigoCliente = Clientes.CodigoCliente GROUP BY CodigoCliente);

--El producto que m�s unidades tiene en stock y el que menos unidades tieneSELECT Nombre FROM Productos WHERE CantidadEnStock IN ((SELECT MAX(CantidadEnStock) FROM Productos), (SELECT MIN(CantidadEnStock) FROM Productos));--Pr�ctica 4.4: Consultas multitabla con la BBDD jardiner�a
USE Jardineria;

--1. Sacar un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas
SELECT NombreCliente, Nombre, Apellido1 FROM Clientes LEFT JOIN Empleados ON CodigoEmpleadoRepVentas = CodigoEmpleado;

--2. Mostrar el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT NombreCliente, Nombre FROM Clientes c LEFT JOIN Pagos p ON c.CodigoCliente = p.CodigoCliente JOIN Empleados ON CodigoEmpleadoRepVentas = CodigoEmpleado WHERE IDTransaccion IS NULL;

--3. Listar las ventas totales de los productos que hayan facturado m�s de 3000�. Se mostrar� el nombre, unidades vendidas, total facturado y total facturado con impuestos (18%IVA).
SELECT Nombre, SUM(Cantidad), SUM(PrecioUnidad * Cantidad), SUM(PrecioUnidad * Cantidad * 1.18) FROM DetallePedidos dp JOIN Productos p ON p.CodigoProducto=dp.CodigoProducto GROUP BY Nombre HAVING SUM(PrecioUnidad * Cantidad) > 3000;--4. Listar la direcci�n de las oficinas que tengan clientes en Fuenlabrada.SELECT DISTINCT o.LineaDireccion1 + ' ' + o.LineaDireccion2 FROM Clientes c JOIN Empleados e ON c.CodigoEmpleadoRepVentas = e.CodigoEmpleado JOIN Oficinas o ON o.CodigoOficina = e.CodigoOficina WHERE c.Ciudad = 'fuenlabrada';--Pr�ctica 4.9: Consultas multitabla con la BBDD jardiner�a
USE Jardineria

--1. El nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT c.NombreCliente, e.Nombre, o.Ciudad FROM Clientes c JOIN Empleados e ON c.CodigoEmpleadoRepVentas = e.CodigoEmpleado JOIN Oficinas o ON o.CodigoOficina = e.CodigoOficina;

--2. La misma informaci�n que en la pregunta anterior pero solo los clientes que no hayan hecho pagos.
SELECT c.NombreCliente, e.Nombre, o.Ciudad FROM Clientes c JOIN Empleados e ON c.CodigoEmpleadoRepVentas = e.CodigoEmpleado JOIN Oficinas o ON o.CodigoOficina = e.CodigoOficina WHERE c.CodigoCliente NOT IN (SELECT CodigoCliente FROM Pagos);
SELECT c.NombreCliente, e.Nombre, o.Ciudad FROM Clientes c JOIN Empleados e ON c.CodigoEmpleadoRepVentas = e.CodigoEmpleado JOIN Oficinas o ON o.CodigoOficina = e.CodigoOficina WHERE NOT EXISTS (SELECT CodigoCliente FROM Pagos p WHERE p.CodigoCliente = c.CodigoCliente);
SELECT c.NombreCliente, e.Nombre, o.Ciudad FROM Clientes c JOIN Empleados e ON c.CodigoEmpleadoRepVentas = e.CodigoEmpleado JOIN Oficinas o ON o.CodigoOficina = e.CodigoOficina LEFT JOIN Pagos p ON p.CodigoCliente = c.CodigoCliente WHERE IDTransaccion IS NULL;

--3. Un listado con el nombre de los empleados junto con el nombre de sus jefes.
SELECT e.Nombre AS Subordinado, j.Nombre AS Jefe FROM Empleados e JOIN Empleados j ON e.CodigoJefe=j.CodigoEmpleado;

--Subordinas por jefe que no estan en la oficina de barcelona.
SELECT j.Nombre AS Jefe, COUNT(e.Nombre) AS Subordinado FROM Empleados e JOIN Empleados j ON e.CodigoJefe=j.CodigoEmpleado JOIN Oficinas o ON e.CodigoOficina=o.CodigoOficina WHERE o.Ciudad != 'Barcelona' GROUP BY j.Nombre;

--4. El nombre de los clientes a los que no se les ha entregado a tiempo un pedido (FechaEntrega > FechaEsperada).
SELECT NombreCliente FROM Clientes WHERE CodigoCliente IN (SELECT CodigoCliente FROM Pedidos WHERE FechaEntrega > FechaEsperada);


--Pr�ctica 4.10: Consultas variadas con la BBDD jardiner�a
USE Jardineria;

--1. Un listado de clientes indicando el nombre del cliente y cu�ntos pedidos ha realizado.
SELECT c.NombreCliente, COUNT(CodigoPedido) AS Pedidos_realizados FROM Clientes c JOIN Pedidos p ON c.CodigoCliente = p.CodigoCliente GROUP BY c.NombreCliente;

--2. Un listado con los nombres de los clientes y el total pagado por cada uno de ellos
SELECT NombreCliente, SUM(Cantidad) AS Total_pagado FROM Clientes c JOIN Pagos p ON c.CodigoCliente = p.CodigoCliente GROUP BY NombreCliente;

--3. El nombre de los clientes que hayan hecho pedidos en 2008.
SELECT NombreCliente FROM Clientes WHERE CodigoCliente IN (SELECT CodigoCliente FROM Pedidos WHERE YEAR(FechaPedido) = 2008);

--4. El nombre del cliente y el nombre y apellido de sus representantes de aquellos clientes que no hayan realizado pagos.
SELECT NombreCliente, Nombre, Apellido1 FROM Clientes JOIN Empleados ON CodigoEmpleadoRepVentas = CodigoEmpleado WHERE CodigoCliente NOT IN (SELECT CodigoCliente FROM Pagos);

--5. Un listado de clientes donde aparezca el nombre de su comercial Y la ciudad donde est� su oficina
SELECT NombreCliente, o.Ciudad FROM Clientes JOIN Empleados e ON CodigoEmpleadoRepVentas = CodigoEmpleado JOIN Oficinas o ON o.CodigoOficina = e.CodigoOficina;

--6. El nombre, apellidos, oficina y cargo de aquellos que no sean representantes de ventas.
SELECT Nombre, Apellido1, Apellido2, CodigoOficina FROM Empleados WHERE Puesto != 'Representante Ventas';

--7. Cu�ntos empleados tiene cada Oficina, mostrando el nombre de la ciudad donde est� la oficina.
SELECT Ciudad, COUNT(CodigoEmpleado) AS Empleados FROM Empleados e JOIN Oficinas o ON e.CodigoOficina = o.CodigoOficina GROUP BY Ciudad;

--8. Un listado con el nombre de los empleados, y el nombre de sus respectivos jefes.
SELECT e.Nombre AS Subordinado, j.Nombre AS Jefe FROM Empleados e JOIN Empleados j ON e.CodigoJefe=j.CodigoEmpleado;

--9. El nombre, apellido, oficina (ciudad) y cargo del empleado que no represente a ning�n cliente.
SELECT Nombre, Apellido1, Ciudad, Puesto FROM Empleados e JOIN Oficinas o ON e.CodigoOficina = o.CodigoOficina WHERE CodigoEmpleado NOT IN (SELECT CodigoEmpleadoRepVentas FROM Clientes);

--10. La media de unidades en stock de los productos agrupados por gama.
SELECT Gama, AVG(CantidadEnStock) AS Stock FROM Productos GROUP BY Gama;

--11. Los clientes que residan en la misma ciudad donde hay una oficina, indicando d�nde est� la oficina.
SELECT NombreCliente, o.Ciudad FROM Clientes c JOIN Oficinas o ON c.Ciudad = o.Ciudad;

--12. Los clientes que residan en ciudades donde no hay oficinas ordenado por la ciudad donde residen.
SELECT NombreCliente, c.Ciudad FROM Clientes c LEFT JOIN Oficinas o ON c.Ciudad = o.Ciudad WHERE o.Ciudad IS NULL ORDER BY c.Ciudad;

--13. El n�mero de clientes que tiene asignado cada representante de ventas.
SELECT CodigoEmpleadoRepVentas, COUNT(CodigoCliente) AS Clientes FROM Clientes GROUP BY CodigoEmpleadoRepVentas;

--14. Cu�l fue el cliente que hizo el pago con mayor cuant�a y el que hizo el pago con menor cuant�a.
SELECT NombreCliente ,SUM(PrecioUnidad * Cantidad) AS Precio_total_min FROM DetallePedidos dp 
JOIN Pedidos p ON dp.CodigoPedido=p.CodigoPedido 
JOIN Clientes c ON p.CodigoCliente=c. CodigoCliente 
GROUP BY dp.CodigoPedido, NombreCliente 
HAVING SUM(PrecioUnidad * Cantidad) <= ALL (SELECT SUM(PrecioUnidad * Cantidad) FROM DetallePedidos GROUP BY CodigoPedido);

SELECT NombreCliente ,SUM(PrecioUnidad * Cantidad) AS Precio_total_max FROM DetallePedidos dp 
JOIN Pedidos p ON dp.CodigoPedido=p.CodigoPedido 
JOIN Clientes c ON p.CodigoCliente=c. CodigoCliente 
GROUP BY dp.CodigoPedido, NombreCliente 
HAVING SUM(PrecioUnidad * Cantidad) >= ALL (SELECT SUM(PrecioUnidad * Cantidad) FROM DetallePedidos GROUP BY CodigoPedido);

--15. Un listado con el precio total de cada pedido.
SELECT CodigoPedido, SUM(PrecioUnidad * Cantidad) AS Precio_total FROM DetallePedidos GROUP BY CodigoPedido;

--16. Los clientes que hayan hecho pedidos en el 2008 por una cuant�a superior a 2000 euros.
SELECT DISTINCT NombreCliente FROM DetallePedidos dp 
JOIN Pedidos p ON dp.CodigoPedido=p.CodigoPedido 
JOIN Clientes c ON p.CodigoCliente=c. CodigoCliente
WHERE YEAR(FechaPedido) = 2008
GROUP BY dp.CodigoPedido, NombreCliente
HAVING SUM(PrecioUnidad * Cantidad)>2000;

--17. Cu�ntos pedidos tiene cada cliente en cada estado.
SELECT NombreCliente, Estado, COUNT(CodigoPedido) FROM Clientes c JOIN Pedidos p ON c.CodigoCliente=p.CodigoCliente GROUP BY NombreCliente, Estado;

--18. Los clientes que han pedido m�s de 200 unidades de cualquier producto. 
SELECT NombreCliente FROM Clientes WHERE CodigoCliente IN 
(SELECT CodigoCliente FROM Pedidos WHERE CodigoPedido IN 
(SELECT CodigoPedido FROM DetallePedidos GROUP BY CodigoPedido HAVING SUM(Cantidad)>200));


--Pr�ctica 4.12: Consultas con tablas derivadas
USE Jardineria;
USE nba;

--2. El importe medio de los pedidos de la BBDD jardiner�a. 
SELECT AVG(Importe) AS Importe_medio FROM 
(SELECT SUM(PrecioUnidad * Cantidad) AS Importe, CodigoPedido FROM DetallePedidos 
GROUP BY CodigoPedido) AS tabala1;

--3. Un listado con el n�mero de partidos ganados por los equipos de la NBA. 
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