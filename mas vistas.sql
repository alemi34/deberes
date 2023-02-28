use prueba

create table cocineros(
nombre varchar(20),
edad int,
pais varchar(20)
)

insert into cocineros values
('pepe',23,'Espa�a'), ('Juan',33,'Francia'),('Manolo',56,'Francia')

create view solofranceses as 
select nombre,pais from cocineros
where pais ='Francia' with check option

create view solofranceses2 as 
select nombre,pais from cocineros
where pais ='Francia'

insert into solofranceses values ('maria1','Espa�a')
insert into solofranceses2 values ('maria2','Espa�a')

use Jardineria
--sobre la base jardineria crear una vista para empleado emmanuel maga�a que contenga solo los datos de los pedidos realizados por sus clientes
select * from Empleados where Nombre like 'emmanuel'

create view emmanuel_maga�a as 
select * from Pedidos 
where CodigoCliente in(select CodigoCliente from Clientes where 
CodigoEmpleadoRepVentas = (select codigoEmpleado from Empleados where nombre like '%Emmanuel%' and Apellido1 like '%Maga�a%'))

select * from emmanuel_maga�a

create view vista_pedido2 as
select NombreCliente,CodigoPedido,Nombre, FechaPedido,FechaEsperada,FechaEntrega,Estado,Comentarios,importe
from Empleados e join Clientes c on e.CodigoEmpleado=c.CodigoEmpleadoRepVentas join Pedidos p on p.CodigoCliente=c.CodigoCliente

select * from vista_pedido2
select * from Pedidos

