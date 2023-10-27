import viajes.*

class Socio {
	const actividades = []
	var maximoDeActividades 
	var edad
	const idiomaQueHabla = #{}

	method agregarActividades(actividad) {
		if (actividades.size() == maximoDeActividades){
			self.error("No puede realizar más actividades")
		}
		actividades.add(actividad)	
	}
	
	method maximoDeActividades(maximo){
		maximoDeActividades = maximo
	} 
	
	method adoradorDelSol(){
		return actividades.all({a => a.broncearse()})
	}
	
	method coleccionDeEsfuerzo() {
		return actividades.filter({a => a.esfuerzo()})
	}
	
	method agregarIdioma(idioma) {
		idiomaQueHabla.add(idioma)
	}
	
	method idiomaQueHabla() = idiomaQueHabla
	method edad() = edad
	
	method leAtrae(actividad) 
	
	method noRealizoLaActividad(actividad) {
		return ! actividades.contains(actividad)
	}
}

class SocioTranquilo inherits Socio {
	override method leAtrae(actividad){
		return actividad.cantidadDeDias() >= 4
	}
}

class SocioCoherente inherits Socio {
	override method leAtrae(actividad){
		return actividad.broncearse() or actividad.esfuerzo()
	}
}

class SocioRelajado inherits Socio {
	override method leAtrae(actividad){
		return idiomaQueHabla.intersection(actividad.idiomas()).size() >= 2
	}
}