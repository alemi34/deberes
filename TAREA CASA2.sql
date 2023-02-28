USE Jardineria
--1
select codigooficina, ciudad
from oficinas;

--2
select count(codigoempleado)
from empleados;

--3
select count(codigocliente), pais
from clientes
group by pais;

---4
select avg(cantidad) 'Pago Medio 2009'
from pagos
where year(fechapago) = 2009

--5
select count(codigopedido)
from pedidos
group by estado
order by count(codigopedido) desc

--6
select max(precioventa), min(precioventa) 'Precio Minimo'
from productos

-- 4.7

--1
select ciudad, telefono
from oficinas
where ciudad = 'EEUU';

--2
select nombre, Apellido1, email from empleados
where codigojefe = 3

--3
select Puesto, nombre, apellido1, email from empleados
where puesto = 'Director General'

select Puesto, nombre, apellido1, email from empleados
where codigojefe is null



--4
select nombre, apellido1, Puesto from empleados
where puesto <> 'Representante de Ventas'

--5
select count(codigocliente) from clientes

--6
select nombrecliente from clientes
where pais in('Spain', 'España')

--7
select count(codigocliente), pais from clientes
group by pais


--8
select count(codigocliente) from clientes
where ciudad = 'Madrid'

--9
select count(codigocliente) from clientes
where ciudad like 'M%'

--10
select count(CodigoCliente), CodigoEmpleadoRepVentas FROM Clientes 
GROUP BY CodigoEmpleadoRepVentas

--11
select count(CodigoEmpleadoRepVentas) from clientes
where codigoEmpleadoRepVentas is null
select * from clientes

--12
select (
select top 1 fechapago from pagos
order by fechapago asc)
union 
select(
select top 1 fechapago from pagos
order by fechapago desc)

--13
select codigocliente from pagos
where year(fechapago) = 2008

--14
select distinct estado from pedidos

--15
select codigopedido, codigocliente, fechaesperada, fechaentrega from pedidos 
where fechaesperada<fechaentrega

--16
select count(CodigoProducto), CodigoPedido from DetallePedidos pedidos
group by codigopedido

--17
select top 20 codigopedido from detallepedidos
order by cantidad

--18
select codigopedido, codigocliente, fechaesperada, fechaentrega from Pedidos 
where fechaentrega <= dateadd(day,2,fechaesperada)

--19
SELECT sum(cantidad*Preciounidad) AS baseImponible, sum(cantidad*Preciounidad)*0.21 AS iva, sum(cantidad*Preciounidad)*1.21 AS total
 FROM DetallePedidos
--20


