create database ejercicio2
use ejercicio2

CREATE SCHEMA Datos AUTHORIZATION dbo
CREATE SCHEMA Pedidos AUTHORIZATION dbo



create table Datos.clientes(
id_cliente int primary key,
nomb_cliente varchar(50),
direccion varchar(50),
telefono numeric,
tipo_cliente varchar
)

create table Datos.Ciudad(
nomb_ciudad varchar (50) primary key,
departamento int
)

