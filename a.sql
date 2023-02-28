--cuanto cueste <pedido y nombre del cliente
USE Jardineria
select * from DetallePedidos
SELECT SUM(d.PrecioUnidad*Cantidad), c.NombreCliente From DetallePedidos d join Pedidos p on d.CodigoPedido = p.CodigoPedido join Clientes c ON p.CodigoCliente=c.CodigoCliente
group by d.CodigoPedido, c.NombreCliente
having SUM(d.PrecioUnidad*Cantidad)<= all(SELECT SUM(d.PrecioUnidad*Cantidad) From DetallePedidos d group by CodigoPedido) 

SELECT AVG(preciototal) FROM (SELECT SUM(d.PrecioUnidad*Cantidad) as preciototal From DetallePedidos d group by CodigoPedido) AS tabla1
use nba
-- Un listado con el número de partidos ganados por los equipos de la NBA
SELECT equipo_local, count(equipo_local) FROM partidos
where puntos_local> puntos_visitante 
group by equipo_local

SELECT equipo_visitante, count(equipo_local) as local FROM partidos
where puntos_local< puntos_visitante 
group by equipo_visitante

SELECT avg(ganados) FROM (SELECT count(nombre) ganados, nombre, conferencia FROM equipos e JOIN partidos p on (e.Nombre=p.equipo_local and puntos_local>puntos_visitante) OR (e.Nombre=p.equipo_visitante and puntos_local<puntos_visitante)
group by Nombre, Conferencia) as t1
where Conferencia='West'

--4.11
USE NBA
--1 Equipo y ciudad equipo de los jugadores españoles de la NBA.
SELECT e.nombre, e.Ciudad FROM equipos e join jugadores j on e.Nombre=j.Nombre_equipo
Where j.Procedencia like 'Spain'
--2 Equipos que comiencen por H y terminen en S.
SELECT nombre FROM equipos
WHERE Nombre like 'H%S'
--3 Puntos por partido de 'Pau Gasol' en toda su carrera.
SELECT SUM(Puntos_por_partido) FROM estadisticas e join jugadores j on j.codigo=e.jugador
Where Nombre='Pau Gasol'
--4 Equipos que hay en la conferencia oeste ('west').
SELECT Nombre FROM equipos
Where Conferencia='West'
--5 Jugadores de Arizona que pesen más de 100 kilos y midan más 1.82m (6 pies)
SELECT Nombre FROM jugadores
Where Procedencia='Arizona' and Peso>100 and Altura>5.9				
--6 Puntos por partido de los jugadores de los 'cavaliers'.

--7 Jugadores cuya tercera letra de su nombre sea la v.

--8 Número de jugadores que tiene cada equipo de la conferencia oeste

--9 Número de jugadores Argentinos en la NBA.

--10 Máxima media de puntos de 'Lebron James' en su carrera.

--11 Asistencias por partido de 'Jose Calderon' en la temporada '07/08

--12 Puntos por partido de 'Lebron James' en las temporadas del 03/04 al 05/06

--13 Número de jugadores que tiene cada equipo de la conferencia este

--14 Tapones por partido de los jugadores de los 'Lakers’

--15 Media de rebotes de los jugadores de la conferencia Este 'East'.

--16 Rebotes por partido de los jugadores de los equipos de Los Ángeles.

--17 Número de jugadores que tiene cada equipo de la división NorthWest.

--18 Número de jugadores de España y Francia en la NBA.

--19 Número de pivots 'C' que tiene cada equipo.

--20 ¿Cuánto mide el pívot más alto de la nba?

--21 ¿Cuánto pesa (en libras y en kilos) el pívot más alto de la NBA?

--22 Número de jugadores que empiezan por 'Y'.

--23 Jugadores que no metieron ningún punto en alguna temporada.

--24 Número total de jugadores de cada división.

--25 Peso medio en kilos y en libras de los jugadores de los 'Raptors'.

--26 Mostrar un listado de jugadores con el formato Nombre(Equipo) en una sola columna.

--27 Puntuación más baja de un partido de la NBA.

--28 Primeros 10 jugadores por orden alfabético.

--29 Temporada con más puntos por partido de 'Kobe Bryant'.

--30 Número de bases 'G' que tiene cada equipo de la conferencia este 'East'.

--31 Número de equipos que tiene cada conferencia.

--32 Nombre de las divisiones de la conferencia Este.

--33 Máximo reboteador de los 'Suns'.

--34 Máximo anotador de la toda base de datos en una temporada.

--35 Sacar cuántas letras tiene el nombre de cada jugador de los 'grizzlies' (Usar función LENGTH).

--36 ¿Cuántas letras tiene el equipo con nombre más largo de la NBA(Ciudad y Nombre)? 

