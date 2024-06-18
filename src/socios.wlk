import actividades.*

class Socio {
	var property actividadesRealizadas
	var property maximoDeActividadesPermitidas
	var property edad = 0
	var property idiomasQueHabla = []
	
	method actividadesRealizadas() = actividadesRealizadas
	
	method esAdoradorDelSol(){
		return actividadesRealizadas.all({actividad => actividad.sirveParaBroncearse()})
	}
	
	method actividadesEsforzadas(){
		return actividadesRealizadas.filter({actividad => actividad.implicaEsfuerzo()})
	}
	
	method registrarActividad(actividad){
		if(maximoDeActividadesPermitidas > actividadesRealizadas.size()){
			actividadesRealizadas.add(actividad)
		} else {
			self.error("Ya alcanzó el máximo de actividades permitidas")
		}
	}
	
	method leAtrae(actividad)= false
}

class Tranquilo inherits Socio{
	
	override method leAtrae(actividad){
		return actividad.duracion() >= 4
	}
}

class Coherente inherits Socio{
	
	override method leAtrae(actividad){
		return self.esAdoradorDelSol() or actividad.implicaEsfuerzo()
	}
}

class Relajado inherits Socio{
	
	override method leAtrae(actividad){
		return actividad.idiomas().any({idiomaX => self.idiomasQueHabla().contains(idiomaX)})
		
	}
	
}
