use ejerhotel

select * from clientes

create view clientes2 as 
select Identificacion,Pais,Apellido1,Apellido2,Direccion,Telefono
from clientes

select * from clientes2


select * from tipo_servicio
insert into tipo_servicio
values('OCIO')


select * from servicios;

insert into servicios values(
4,'OCIO','Ocio',10.00,7.00,getdate()
)


select * from reserva_habitac
insert into reserva_habitac values(
'02/06/2009','04/06/2009',0.07,101,12345
)

delete from reserva_habitac
where NumHABITACION=101 and FechaENTRADA='02/06/2009'


select * from clientes 
where Apellido1 like '%le%'
order by Identificacion

select * from clientes
where Observaciones is not null

select * from servicios 
where Precio>5
order by idSERVICIOS

select * from habitaciones
where NumHABITACION in (select NumHABITACION from reserva_habitac where  FechaENTRADA<'24/03/2009' and FechaSALIDA>'24/03/2009')

select * from clientes 
where Pais = 'España' or pais = 'Francia'