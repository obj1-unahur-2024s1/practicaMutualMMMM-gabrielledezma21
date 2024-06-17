class Viaje{
	
	const property idiomas
	var property implicaEsfuerzo
	var property sirveParabroncearse
	var property duracion
	
}

class DePlaya inherits Viaje{
	
	const property largo
	
	override method duracion(){
		return largo / 500
	}
	
	override method implicaEsfuerzo(){
		return largo > 1200
	}
	
	override method sirveParabroncearse()= true
		
}

class ExcursionACiudad inherits Viaje{
	
	var property cantidadDeAtracciones
	
	override method duracion(){
		return cantidadDeAtracciones / 2
	}
	
	override method implicaEsfuerzo(){
		return cantidadDeAtracciones.between(5,8)
	}
	
	override method sirveParabroncearse()= false
	
}

class ExcursionACiudadTropcial inherits ExcursionACiudad{
	
	override method duracion(){
		return super() + 1
	}
	
	override method sirveParabroncearse()= true
}

class SalidaDeTrekking inherits Viaje{
	
	var property kilometrosDeSenderos
	var property diasDeSolAnuales
	
	override method duracion(){
		return kilometrosDeSenderos / 50
	}
	
	override method implicaEsfuerzo(){
		return kilometrosDeSenderos > 80
	}
	
	override method sirveParabroncearse(){
		return ( diasDeSolAnuales > 200 ) or ( diasDeSolAnuales.between(100,200) and kilometrosDeSenderos > 120 )
	}
	
}