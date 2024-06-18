import socios.*

class Actividad {
	
	var property idiomas = []
	var property implicaEsfuerzo = false
	var property sirveParaBroncearse = false
	var property duracion = 0
	
	method esRecomendada(socio) 
	
}

class Viaje inherits Actividad{
		
	method esInteresante() = idiomas.size() > 1
	
	override method esRecomendada(socio){
		
		return self.esInteresante() and socio.leAtrae(self) and not socio.actividadesRealizadas().contains(self)
	}
}

class DePlaya inherits Viaje{
	
	var property largo
	
	override method initialize(){
		super()
		duracion = largo / 500
		implicaEsfuerzo = largo > 1200
		sirveParaBroncearse = true
	}
		
}

class ExcursionACiudad inherits Viaje{
	
	var property cantidadDeAtracciones
	
	override method initialize(){
		duracion = cantidadDeAtracciones / 2
		implicaEsfuerzo = cantidadDeAtracciones.between(5,8)
		sirveParaBroncearse = false
	}
	
	override method esInteresante(){
		return super() or cantidadDeAtracciones == 5
	}
	
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	
	override method initialize(){
		super()
		duracion += 1
		sirveParaBroncearse = true
	}
	
}

class SalidaDeTrekking inherits Viaje{
	
	var property kilometrosDeSenderos
	var property diasDeSolAnuales
	
	
	override method initialize(){
		duracion = kilometrosDeSenderos / 50
		implicaEsfuerzo = kilometrosDeSenderos > 80
		sirveParaBroncearse = ( diasDeSolAnuales > 200 ) or ( diasDeSolAnuales.between(100,200) and kilometrosDeSenderos > 120 )
	}
	
	override method esInteresante(){
		return super() and diasDeSolAnuales > 140
	}
}

class ClaseDeGimnasia inherits Actividad{
	
	override method initialize(){
		idiomas = ["español"]
		duracion = 1
		implicaEsfuerzo = true
		sirveParaBroncearse = false
	}
	
	override method esRecomendada(socio){
		return socio.edad().between(20,30)
	}
}