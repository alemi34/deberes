use compras
--null if sirve para devolver el valor null si dos expresiones son iguales
select NULLIF(stockmin, stockart) from Articulos
--coalesce sirve para devolver el primer valor no nulose
select coalesce(stockart, stockmin) from Articulos
--isnull sirve para devolver cuando un valor es nulo y cambiarlo por lo que tu quieras
select isnull(stockart, 0) from Articulos
--datepart sirve para extraer una parte especifica de una fecha
select datepart(year, fechaped) from pedidos
--datename sirve para que devuelva una parte especifica de la fecha per en vez con numeros con texto
select datename(MONTH, fechaped) from pedidos
--dateadd sirve para agregarle a una fecha tiempo que tu deses
select dateadd(day, 3, fechaped) from pedidos
--fecha actual
 select convert(date,getdate())
 --dia actual
 select datepart(day,GETDATE())
 --numero de semana actual
 SELECT DATEPART(WEEK, getdate())
 --dia de la semana
 SELECT DATEPART(WEEKDAY, GETDATE());
 --nombre del dia de la semana 
 select datename(weekday, getdate())
 --nombre del mes
 select datename(MONTH, getdate()) 
 --trimestre actual
 SELECT CEILING(DATEPART(QUARTER, GETDATE())/3.0)
 --hoy -30 dias 
 SELECT DATEADD(day, -30, GETDATE())
 --mismo dia del mes siguiente 
  SELECT DATEADD(MONTH, 1, GETDATE())
  --mismo dia del año anterior
   SELECT DATEADD(YEAR, -1, GETDATE())
   --primer dia del mes
   SELECT DATEADD(month, DATEDIFF(month, 0, GETDATE()), 0)
