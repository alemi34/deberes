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

--Listado de ciudades en las que ha nacido algún profesor y también algún alumno.  
SELECT distinct ciudad from PERSONA p join PROFESOR pr on pr.DNI=p.DNI
where Ciudad in (SELECT Ciudad from PERSONA p join ALUMNO a on p.DNI=a.DNI)

SELECT ciudad from PERSONA p join PROFESOR pr on pr.DNI=p.DNI
intersect
SELECT ciudad from PERSONA p join ALUMNO a on a.DNI=p.DNI

--Listado del DNI de personas relacionadas con la asignatura 'Seguridad Vial', bien por ser profesor de la misma o por estar matriculado en ella. 
Select DNI FROM ALUMNO a join ALUMNO_ASIGNATURA aa on a.IdAlumno=aa.IdAlumno
where aa.IdAsignatura=(SELECT IdAsignatura FROM ASIGNATURA where Nombre='Seguridad Vial')
union
Select DNI FROM PROFESOR p join ASIGNATURA aa on p.IdProfesor=aa.IdProfesor
where p.IdProfesor IN (SELECT IdProfesor FROM ASIGNATURA where Nombre='Seguridad Vial')