USE nba 
SELECT MAX(peso)FROM jugadores
SELECT MIN(Altura)FROM jugadores
SELECT COUNT(nombre) FROM jugadores
WHERE Nombre_equipo='Lakers'
SELECT AVG(peso) FROM jugadores
WHERE Nombre_equipo='BLAZERS'
SELECT  COUNT(DISTINCT(Procedencia)) FROM jugadores
SELECT nombre_equipo, MAX(peso)FROM jugadores
GROUP BY Nombre_equipo

SELECT AVG(puntos_por_partido) AS 'media puntos por partido',jugador FROM estadisticas
GROUP BY jugador
HAVING AVG(puntos_por_partido)>10

SELECT AVG(peso) AS 'Media de peso', Nombre_equipo FROM jugadores
WHERE Nombre_equipo NOT IN (SELECT Nombre_equipo FROM jugadores Where Procedencia='Spain')
GROUP BY Nombre_equipo
HAVING  AVG(peso)>120 

SELECT nombre FROM jugadores
WHERE procedencia='spain' AND Nombre_equipo in
(SELECT nombre_equipo FROM jugadores
where Procedencia='spain'
GROUP BY Nombre_equipo
HAVING COUNT(Nombre)>1)

