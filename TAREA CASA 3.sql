use empdept
--1
SELECT * FROM empleados 
Where oficio <> 'vendedor'

--2
SELECT emp_no, apellido,dept_no FROM empleados

--3
SELECT salario+comision FROM empleados

--4
SELECT CONCAT(emp_no, ' es ', oficio) FROM empleados

--5
SELECT apellido, salario, comision FROM empleados
where oficio='vendedor'

--6
SELECT * FROM empleados
Where apellido like 'M%' AND salario BETWEEN 100000 AND 200000

--7
SELECT * FROM empleados
WHERE dept_no=10 or dept_no=30

--8
SELECT * FROM empleados
ORDER by dept_no ASC

--9
SELECT * FROM empleados
ORDER by oficio asc,  salario desc

--10
SELECT max(salario), min(salario), max(salario)-min(salario) FROM empleados

--11
SELECT MAX(fecha_alt) FROM empleados

--12
SELECT AVG(salario) FROM empleados

--13
SELECT AVG(comision) FROM empleados

--14
SELECT  AVG(isnull(salario,0)+salario) FROM empleados

--15
SELECT dept_no ,count(emp_no) FROM empleados
group by dept_no

--16
SELECT  * from empleados 
WHERE salario IN (select max(salario) FROM empleados group by oficio )and oficio<>'presidente'

--17
SELECT distinct oficio FROM empleados p
Where 2<(SELECT count(emp_no) FROM empleados e WHERE e.oficio=p.oficio)

--18
SELECT distinct oficio FROM empleados p
Where 2<(SELECT count(emp_no) FROM empleados e WHERE e.oficio=p.oficio)
and salario>1400

--19
SELECT distinct dept_no FROM empleados p
Where 7000<(SELECT sum(salario) FROM empleados e WHERE p.dept_no=e.dept_no)

--20
SELECT distinct dept_no FROM empleados p 
WHERE 2500<(SELECT AVG(salario) FROM empleados e WHERE p.dept_no=dept_no)

--21
SELECT emp_no, apellido FROM empleados 
WHERE apellido like 'A%'

--22 
SELECT emp_no, apellido FROM empleados
WHERE apellido LIKE '%Z'

--23
SELECT * from empleados
WHERE apellido LIKE 'A%' AND oficio like '%E%'

--24
SELECT emp_no, apellido FROM empleados 
Where salario BETWEEN 100000 AND 200000

--25
SELECT apellido, comision FROM empleados
Where comision is null and apellido like 'J%'

--26
SELECT apellido, salario FROM empleados
WHERE oficio not in('ANALISTA','Empleado') AND salario>1200

--27

