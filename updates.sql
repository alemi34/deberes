update Articulos
set stockmin = stockmin + '5'

--actualizar stock minimo de los articulos que hallan sido comprado 5 veces

update Articulos set 
stockmin = 10
where codigart IN (SELECT codigart FROM Lineas group by codigart having count(codigart)>3)

select * from Articulos

use Jardineria

--crear table internet que contenga el codigo del pedido y el importe del pedido 


SELECT codigoPedido, sum(cantidad*PrecioUnidad) AS precio INTO internet FROM DetallePedidos group by CodigoPedido
SELECT * FROM internet

update Pedidos set
importe = precio FROM  internet i join pedidos p on i.codigoPedido=p.CodigoPedido
SELECT * FROM Pedidos

update Pedidos set 
importe=(SELECT importe from internet where internet.codigoPedido=Pedidos.CodigoPedido)


-------------------------------------------------------------------------------------------------

--pau gassol se cambia a los nikss y pesa 80 lb +
use nba
select distinct  Nombre_equipo FROM jugadores

SELECT * from jugadores where nombre = 'pau gasol'

update jugadores set 
Nombre_equipo = 'Knicks' , peso =peso +80
where nombre = 'pau gasol'

--update jugadores set 
--peso = peso * 0.4535

-------------------------------------------------------------------------------------------------------------------
USE Jardineria
select * from Oficinas
insert into Oficinas
VALUES ( 'MAD-FN', 'Fuenlabrada', 'España', 'madrid', '05056','+34 97 5556664', 'Avenida central 2', 'NULL')


SELECT * FROM Empleados
INSERT into Empleados
values (32, 'jose', 'lopez', NULL, 5465, 'Josel@jardineria.es', 'MAD-FN', 1 , 'Representante Ventas')

SELECT * FROM Clientes
INSERT into Clientes
VALUES (39, 'FLOR SA', 'PEPE', 'Martinez', 4354135435, 5634513513, 'C/roman', NULL, 'Fuenlabrada', 'madird', 'España', 26541 ,32, 300000.00)

select * from Pedidos
INSERT into Pedidos
VALUES(129,'2008-11-12','2008-12-13','2008-12-13', 'Entregado', NULL, 39, 51236)

SELECT * FROM DetallePedidos
insert into DetallePedidos
values(129, 'OR-150',12,2.00,2) , (129, 'OR-104', 10, 10.00,2)

--tabla nueva todos datos empleados de barcelona 
select * from Oficinas
SELECT *  into BCN FROM Empleados
where CodigoOficina in (select CodigoOficina from Oficinas where Region = 'Barcelona')

select * from BCN

-- borrar de empleados a los empleados de barcelona 


delete from Empleados 
select * from Empleados
where CodigoOficina in (select CodigoOficina from Oficinas where Region ='Barcelona') and CodigoEmpleado not in (select CodigoEmpleadoRepVentas from Clientes)

----
INSERT into  Empleados
SELECT * FROM BCN
where CodigoOficina in (select CodigoOficina from Oficinas where Region ='Barcelona') and CodigoEmpleado not in (select CodigoEmpleadoRepVentas from Clientes)

----------------------------------------------------------------------
update DetallePedidos
set IVA =18 
where CodigoPedido in (select CodigoPedido from Pedidos where FechaPedido >= '2010-06-01')

update DetallePedidos
set IVA =21 
where CodigoPedido in (select CodigoPedido from Pedidos where FechaPedido < '2010-06-01')

update DetallePedidos
set totalinea = PrecioUnidad*IVA/100

DELETE from Clientes where LimiteCredito = (select min(limitecredito) from Clientes)

------------------------------------------------------------------------------------------------------------------------------------------------------------