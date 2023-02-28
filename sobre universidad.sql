USE nba
--elejir el nombre del equipo cuando gana como local y cuando gana como visitante 
select count(equipo),equipo FROM (select equipo_local equipo from partidos where puntos_local>puntos_visitante
union all
select equipo_visitante FROM partidos d
where puntos_local<d.puntos_visitante) as t1
group by equipo



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE Universidad
--Listado de ciudades en las que ha nacido algún profesor pero no un alumno (y lo contrario).  
SELECT ciudad from PERSONA p join PROFESOR pr on pr.DNI=p.DNI
where Ciudad not in (SELECT Ciudad from PERSONA p join ALUMNO a on p.DNI=a.DNI)
union
SELECT ciudad from PERSONA p join ALUMNO a on a.DNI=p.DNI
where Ciudad not in (SELECT Ciudad from PERSONA p join PROFESOR pr on p.DNI=pr.DNI)