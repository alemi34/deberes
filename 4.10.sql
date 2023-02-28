use jardineria;

--1. Un listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado.
select c.nombrecliente, count(d.cantidad) as NumeroPedidos from 
clientes c join Pedidos p 
on c.CodigoCliente=p.codigocliente
join DetallePedidos d on p.CodigoPedido=d.CodigoPedido
group by c.nombrecliente;

--2. Un listado con los nombres de los clientes y el total pagado por cada uno de ellos.
select c.nombrecliente, SUM(cantidad) AS totalpagado from 
clientes c join Pagos p 
on c.CodigoCliente=p.codigocliente
group by NombreCliente
--3. El nombre de los clientes que hayan hecho pedidos en 2008.
select c.nombrecliente, p.fechapedido from 
clientes c join Pedidos p 
on c.CodigoCliente=p.codigocliente
where p.fechapedido like ('2008%');

--4. El nombre del cliente y el nombre y apellido de sus representantes de aquellos clientes que no hayan realizado pagos. 
select c.nombrecliente, nombre, (apellido1+' '+apellido2)as apellidos from 
empleados e join clientes c
on c.codigoempleadorepventas=e.CodigoEmpleado
left join pedidos p on c.codigocliente=p.CodigoCliente
where p.codigopedido is null;

--5. Un listado de clientes donde aparezca el nombre de su comercial Y la ciudad donde está su oficina
select c.nombrecliente, nombre, o.ciudad from 
clientes c join empleados e
on c.codigoempleadorepventas=e.CodigoEmpleado
join oficinas o on e.codigooficina=o.CodigoOficina

--6. El nombre, apellidos, oficina y cargo de aquellos que no sean representantes de ventas.
select e.nombre, (apellido1+' '+apellido2) as apellidos, o.CodigoOficina, e.puesto from 
empleados e join oficinas o
on e.codigooficina=o.codigooficina
where e.puesto != 'Representante ventas';

--7. Cuántos empleados tiene cada Oficina, mostrando el nombre de la ciudad donde está la oficina.select count(e.nombre)as NumeroEmpleados, o.ciudad from
empleados e join oficinas o
on e.codigooficina=o.codigooficina
group by  o.ciudad;

--8. Un listado con el nombre de los empleados, y el nombre de sus respectivos jefes. 
select e.nombre, e.codigojefe as Jefe, c.Nombre from empleados e join empleados c 
on e.CodigoJefe=c.CodigoEmpleado


--9. El nombre, apellido, oficina (ciudad) y cargo del empleado que no represente a ningún cliente. 


--10. La media de unidades en stock de los productos agrupados por gama. 
select avg(cantidadenstock)as cantidadEnStock from productos
group by gama;

--11. Los clientes que residan en la misma ciudad donde hay una oficina, indicando dónde está la oficina. 
select nombrecliente, o.Ciudad from 
clientes c join empleados e on c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
join oficinas o on e.CodigoOficina=o.CodigoOficina
where c.Ciudad=o.Ciudad;

--12. Los clientes que residan en ciudades donde no hay oficinas ordenado por la ciudad donde residen. 
select nombrecliente from 
clientes c join empleados e on c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
join oficinas o on e.CodigoOficina=o.CodigoOficina
where c.Ciudad!=o.Ciudad
order by c.ciudad;

--13. El número de clientes que tiene asignado cada representante de ventas. 
select count(nombrecliente)as NumeroClientes, nombre from 
clientes c join empleados e on c.CodigoEmpleadoRepVentas=e.CodigoEmpleado
group by e.nombre;

--14. Cuál fue el cliente que hizo el pago con mayor cuantía y el que hizo el pago con menor cuantía.
select c.nombrecliente, max(cantidad)as MayorCuantia, min(cantidad)as MenorCuantia from
clientes c left join pedidos p
on c.CodigoCliente=p.CodigoCliente
join DetallePedidos d on p.CodigoPedido=d.CodigoPedido
group by c.nombrecliente;

--15. Un listado con el precio total de cada pedido. 
select codigopedido, sum(preciounidad*cantidad)as PrecioTotal from DetallePedidos
group by codigopedido;

--16. Los clientes que hayan hecho pedidos en el 2008 por una cuantía superior a 2000 euros. 
select c.nombrecliente from
clientes c left join pedidos p
on c.CodigoCliente=p.CodigoCliente
join DetallePedidos d on p.CodigoPedido=d.CodigoPedido
where fechapedido like '2008%'
group by c.NombreCliente, cantidad
having cantidad >2000;

--17. Cuántos pedidos tiene cada cliente en cada estado.
select c.nombrecliente, count(cantidad)as cantidad, estado from
clientes c join pedidos p on c.CodigoCliente=p.CodigoCliente
join DetallePedidos d on p.CodigoPedido=d.CodigoPedido
group by c.nombrecliente, p.estado;


--18. Los clientes que han pedido más de 200 unidades de cualquier producto.  
select nombrecliente, cantidad from
clientes c join pedidos p on c.CodigoCliente=p.CodigoCliente
join DetallePedidos d on p.CodigoPedido=d.CodigoPedido
where cantidad>=200;

--cuento subordinado por jefe que no estan en la oficina de BCN 
select count(e.nombre), j.Nombre from empleados e join empleados j
on e.CodigoJefe=j.CodigoEmpleado 
join Oficinas o ON e.CodigoOficina=o.CodigoOficina
Where o.Ciudad!='Barcelona'
group by j.Nombre

