--base de datos NBA
USE NBA

--1
SELECT Ciudad FROM equipos
where Nombre IN (SELECT Nombre_equipo FROM jugadores  where altura = (SELECT MAX(altura) FROM jugadores))

--2
SELECT nombre FROM jugadores
where peso> ALL(SELECT peso FROM jugadores where Procedencia='Spain')

--3

--base G pivot C
SELECT Nombre FROM jugadores
WHERE Peso > (SELECT min(Peso) FROM jugadores WHERE Posicion='C') and Posicion='G'

--4
SELECT division FROM equipos
WHERE Nombre IN (SELECT Nombre_equipo FROM jugadores where Procedencia='spain')

--5
SELECT Nombre FROM jugadores
where Nombre IN (SELECT Nombre FROM jugadores  where altura = (SELECT min(altura) FROM jugadores)) AND Nombre_equipo IN (SELECT nombre FROM equipos where Division='southeast')

--6
SELECT distinct jugador FROM estadisticas 
where Puntos_por_partido> all (SELECT AVG(puntos_por_partido) From estadisticas ) Order by 1 desc

--7
SELECT count(nombre) AS 'personas que superan el peso medio', nombre_equipo from jugadores j
WHERE Peso>(SELECT avg(peso) FROM jugadores e) group by Nombre_equipo 

--8
SELECT * FROM jugadores
Where Nombre_equipo='Timberwolves' AND peso>(SELECT AVG(peso) FROM jugadores WHERE Nombre_equipo='Timberwolves')

--9
SELECT * FROM jugadores j
Where Peso>(SELECT avg(peso) FROM jugadores e where j.Nombre_equipo=e.Nombre_equipo)

--10
Select DISTINCT division from equipos 
where Nombre not in (Select Nombre_equipo FROM jugadores Where Procedencia='Slovenia')

--11 
SELECT nombre_equipo FROM jugadores
Where 15<=(SELECT COUNT(codigo)FROM jugadores) group by Nombre_equipo

--BASE DE DATOS COMPRAS
USE compras

--12 
SELECT codigpro, nombrpro FROM Proveedores p 
WHERE codigpro IN (SELECT codigpro From Pedidos)

SELECT codigpro, nombrpro FROM Proveedores p 
WHERE EXISTS (SELECT codigpro From Pedidos e WHERE p.codigpro=e.codigpro)

--13

