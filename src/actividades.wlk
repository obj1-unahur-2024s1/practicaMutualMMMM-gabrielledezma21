class Actividad {
	
	const property idiomas
	var property implicaEsfuerzo
	var property sirveParabroncearse
	var property duracion
}

class Viaje inherits Actividad{
		
	method esInteresante() = idiomas.size() > 2
	
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
	
	override method esInteresante(){
		return super() or cantidadDeAtracciones == 5
	}
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
	
	override method esInteresante(){
		return super() and diasDeSolAnuales > 140
	}
}

class ClaseDeGimnasia inherits Actividad{
	
	override method idiomas() = ["español"]
	
	override method duracion() = 1
	
	override method implicaEsfuerzo() = true
	
	override method sirveParabroncearse() = false
	
}