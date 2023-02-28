Use Prueba
create view vista_empleados 
as select(apellido+''+e.nombre) as nombre, sexo,
s.nombre as seccion,cantidadhijos from empleados as e
join secciones as s on codigo=seccion

select * from vista_empleados
where seccion in(select seccion from secciones where sueldo>=700)

create table t1
(a int ,
b int )

create view v as select a,a*2 as b from t1

use nba
--nombre jugador, codigo , puntos por partido de jugador y usar la vista para que en la tabla jugadores aparezca el nombre del jugador en mayusculas 

create view jugadores_2 as select 
Nombre,codigo, e.Puntos_por_partido
from jugadores j left join estadisticas e on j.codigo=e.jugador

update jugadores_2 
set Nombre = upper(Nombre)

select * from jugadores

use Jardineria
--vista de nombre cliente, codigo pedido, importe pedido
create view pedido_coste as select
NombreCliente,CodigoPedido,importe
from Clientes c left join Pedidos p on c.CodigoCliente=p.CodigoCliente

select * from pedido_coste2

create view pedido_coste2 as select
nombreCliente,t.CodigoPedido,(cantidad*preciounidad) as importe
from Clientes c left join Pedidos p on c.CodigoCliente=p.CodigoCliente join DetallePedidos t on t.CodigoPedido=p.CodigoPedido

/*create view pedido_coste3 as select
nombreCliente,t.CodigoPedido,(select sum((cantidad*preciounidad)) from DetallePedidos where CodigoPedido=CodigoPedido)) as importe
from Clientes c left join Pedidos p on c.CodigoCliente=p.CodigoCliente join DetallePedidos t on t.CodigoPedido=p.CodigoPedido*/

create view pedido_coste3 as select
nombreCliente,p.CodigoPedido,sum(cantidad*preciounidad) as importe
from Clientes c left join Pedidos p on c.CodigoCliente=p.CodigoCliente join DetallePedidos t on t.CodigoPedido=p.CodigoPedido
group by p.CodigoPedido,NombreCliente

select * from pedido_coste3