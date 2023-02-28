	use Banco

	begin try
	update cuenta 
	set saldo=saldo *1.4;
	update cuenta 
	set saldo = saldo-(select cantidad from movimiento where cod_cuenta=4)
	where cod_cuenta=4
	insert into movimiento
	values(getdate(),(select saldo from cuenta where cod_cuenta=4)*0.4,(select DNI from tiene where cod_cuenta=4),4,(select count(DNI) from movimiento)+1)
	end try
	begin catch
	print error_number()
    print ERROR_SEVERITY()
    print ERROR_STATE()
    print ERROR_MESSAGE()
	end catch

	--Los usuarios verian los datos antes de la actualizacion ya que como todavia no se confirmo no se pueden ver los datos actualizados y porque puede ser que se cometiera un error y como todavia no se 
	-- a clicado la confirmacion no se veran los datos actualizados