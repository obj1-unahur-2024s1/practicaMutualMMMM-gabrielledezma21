import actividades.*

class Socio {
	var actividadesRealizadas
	var property maximoDeActividadesPermitidas
	
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
}
