create login Marta With password = '1234'

use compras ;

create user Marta for Login Marta

execute as user ='Marta'
select * from Articulos
select CURRENT_USER
revert

grant select on articulos to  Marta
