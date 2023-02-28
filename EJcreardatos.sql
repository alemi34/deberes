
use pruebaBD1
--1
create view DEP30
as select APELLIDO as APE, OFICIO AS OFI, SALARIO as SAL from empleados 
where dept_no=30

--2
INSERT INTO dep30 VALUES ('Pérez', 'EMPLEADO',1300);
--da error de inserccion porque la clave primaria no puede ser nula 

--3
update dep30
set SAL=SAL+1000

--4
--Elimina todo del departamento30

--5
create view dep10
as select * from empleados
where salario>1200 and dept_no=10;

--6
create view DEPT1
as select e.emp_no,e.apellido,d.dept_no,d.dnombre
from empleados e join departamentos d on e.dept_no=d.dept_no

--7
insert into DEPT1 values(2222,'SUELA',20,'INVESTIGACION')

--8
create view PAGOS as 
select apellido as NOMBRE,salario as SA_MES,12*(salario) as SAL_ANT,dept_no 
from empleados

select * from PAGOS

--9
create view VMEDIA as 
select d.dept_no,d.dnombre,max(salario) as 'salario maximo', avg(salario) as 'salario medio'
from empleados e join departamentos d on e.dept_no=d.dept_no
group by d.dept_no,d.dnombre
select * from VMEDIA

--10
drop view VMEDIA
drop view PAGOS

--11

create view conserjes as
select c.nombre, p.apellidos 
from centros c join personal p on c.cod_centro=p.cod_centro
where funcion='conserje'

select * from conserjes

--12
alter table profesores
add COD_ASIG decimal(2)

--13
create table Tasig(
COD_ASIG numeric(2) not null,
NOM_ASIG varchar(20)
)

--14
alter table Tasig 
add primary key (COD_ASIG) 

--15
alter table profesores
add constraint FK_aisg  foreign key (cod_asig) references tasig(cod_ASIG)

--16
create view centrosprofesores as 
select c.nombre,p.apellidos,p.especialidad
from centros c join profesores p on c.cod_centro=p.cod_centro

--17
create view profesorescentros as
select c.cod_centro,count(p.apellidos) as 'cantidad profesores'
from centros c join profesores p on c.cod_centro=p.cod_centro
group by c.cod_centro

select * from profesorescentros
--18
create table auditoria(
fecha date,
hora time,
persona varchar
)


--sirve para ver los datos de las constraits\restricciones

select * from  INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'profesores'

exec sp_helpconstraint 'profesores'




--19
create table Fabricantes (
cod_fabricante tinyint primary key identity(1,1),
nombre varchar(15),
pais varchar(15) default('ESPAÑA')

)
alter table Fabricantes
add constraint uppercase check(nombre=UPPER(nombre))
alter table Fabricantes
add constraint uppercase2 check(pais=UPPER(pais))


--20
create table ARTICULOS(
articulo varchar(20) not null,
cod_fabricante tinyint not null,
peso tinyint not null,
categoria varchar(10) not null,
precio_venta float,
precio_costo float,
existencias int,
primary key(articulo, cod_fabricante,peso,categoria),
constraint chk1 check (precio_venta >0 ),
constraint chk2 check (precio_costo >0 ),
constraint chk3 check (peso >0 ),
constraint chk4 check (CATEGORIA like 'Primera Segunda Tercera')
)

--21
alter table fabricantes 
add clase_fabricante varchar(10) not null

alter table fabricantes 
add constraint uq unique(nombre)

--22
alter table articulos
alter column Precio_venta decimal(7,2)


--23
alter table articulos
add constraint FK_COD foreign key (cod_fabricante) references fabricantes(cod_fabricante)
