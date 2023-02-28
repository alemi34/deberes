USE cine;

--1 Obtener un listado con los actores más jóvenes que Javier Bardem cuyo nombre no contenga ninguna A
SELECT *, DATEDIFF(yy, FNacimiento, ISNULL(FMuerte, GETDATE())) 'Edad'
FROM actor a
WHERE Nombre NOT LIKE '%a%' AND DATEDIFF(yy, FNacimiento, ISNULL(FMuerte, GETDATE())) < (
	SELECT DATEDIFF(yy, FNacimiento, ISNULL(FMuerte, GETDATE())) 
	FROM actor 
	WHERE Nombre LIKE 'Javier Bardem'
)

--2 Nombre y nacionalidad de los directores que hayan dirigido dos películas y que sigan vivos
SELECT DISTINCT d.Nombre, d.Nacionalidad
FROM director d JOIN pelicula p ON d.CodDirector = p.Director
WHERE p.Director IN (
	SELECT director
	FROM pelicula
	GROUP BY director
	HAVING COUNT(Director) = 2
) AND d.FMuerte IS NULL

--3 Nombre del actor y número de películas de aquel actor que haya participado en el mayor número de películas
SELECT TOP 1 a.Nombre, COUNT(pa.CodPelicula) 'Numero Peliculas'
FROM pelicula p JOIN participa pa ON p.CodPelicula = pa.CodPelicula JOIN actor a ON pa.CodActor = a.CodActor
GROUP BY a.Nombre
ORDER BY COUNT(pa.CodPelicula) DESC;

--4 Mostrar el número de actores que ha participado en cada película junto al título de la película
SELECT p.Titulo, COUNT(pa.CodPelicula) 'Numero Actores'
FROM pelicula p JOIN participa pa ON p.CodPelicula = pa.CodPelicula JOIN actor a ON pa.CodActor = a.CodActor
GROUP BY p.Titulo

--5 Nombre de los actores que han participado en la película ganadora en los años 2005 y 1943
SELECT Nombre
FROM actor
WHERE CodActor IN (
	SELECT CodActor
	FROM participa
	WHERE CodPelicula IN (
		SELECT CodPelicula
		FROM pelicula
		WHERE CodPelicula IN (
			SELECT CodPelicula
			FROM ganaPremio
			WHERE Anyo = 2005 OR Anyo = 1943
		)
	)
)

--6 Nombre de la productora que mayores ingresos totales ha conseguido con sus peliculas
SELECT TOP 1 Productora, SUM(taquilla) 'Ingresos Totales'
FROM pelicula
GROUP BY Productora
ORDER BY SUM(taquilla) DESC

--7 Mostrar el nombre de los actores que hayan trabajado en películas que no han ganado un premio y cuy ataquilla (de esa pelicula)
-- supere la media
SELECT a.Nombre
FROM pelicula p JOIN participa pa ON p.CodPelicula = pa.CodPelicula JOIN actor a ON pa.CodActor = a.CodActor
WHERE Taquilla > (
	SELECT AVG(taquilla)
	FROM pelicula
) AND p.CodPelicula NOT IN (
	SELECT p.CodPelicula
	FROM pelicula p JOIN ganaPremio gp ON p.CodPelicula = gp.CodPelicula
)

--8 Obtener el titulo de todas las películas, junto al número de premios que han obtenido
SELECT p.Titulo, COUNT(gp.CodPremio) 'Numero de Premios'
FROM pelicula p JOIN ganaPremio gp ON p.CodPelicula = gp.CodPelicula
GROUP BY p.Titulo

--9 Obtener el titulo de la película más taquillera por nacionalidad
SELECT Titulo, Nacionalidad
FROM pelicula
WHERE Taquilla IN (
	SELECT MAX(Taquilla)
	FROM pelicula
	GROUP BY Nacionalidad
)

--10 Nombre de los actores que han trabajado con dos o más directores. En la consulta debe mostrarse el nombre del actor y el nombre de los directores

SELECT A.Nombre
FROM actor a JOIN participa pa ON a.CodActor = pa.CodActor
WHERE CodPelicula IN (
	SELECT CodPelicula
	FROM pelicula
	WHERE Director IN (
		SELECT Director
		FROM pelicula
	)
)

 