import libros.*
import socios.*

class Viaje {
	const idiomas = #{}
	method esfuerzo()
	method broncearse()
	method cantidadDeDias() 
	
	method agregarIdioma(idioma) {
		idiomas.add(idioma)
	}
	method idiomas() = idiomas
	
	method esInteresante() {
		return idiomas.size() > 2
	}
	
	method recomendadaPara(socio){
		return self.esInteresante() and socio.leAtrae(self) and socio.noRealizoLaActividad(self)
	}
}

class ViajePlaya inherits Viaje {
	const largo
	
	override method cantidadDeDias() = largo / 500
	
	override method esfuerzo() = largo > 1200 
	
	override method broncearse() = true
}

class ExcursionCiudad inherits Viaje {
	var atracciones
	
	override method cantidadDeDias() = atracciones /2
	
	override method esfuerzo() = atracciones.between(5,8)
	
	override method broncearse() = false
	
	override method esInteresante(){
		return super() and atracciones == 5
	}
}

class ExcursionCiudadTropical inherits ExcursionCiudad{
	override method cantidadDeDias() = super() + 1
	
	override method broncearse() = true
}

class Trekking inherits Viaje{
	var kmCaminando
	var diasDeSol
	
	override method cantidadDeDias() = kmCaminando / 50
	
	override method esfuerzo() = kmCaminando > 80
	
	override method broncearse() = diasDeSol > 200 or (diasDeSol.between(100,200) and kmCaminando > 120 )
	
	override method esInteresante() {
		return super() and diasDeSol > 140
	}  
}

class ClasesDeGym inherits Viaje {
	
	override method agregarIdioma(idioma) {
		idiomas.add("Español")
	}
	
	override method cantidadDeDias() = 1
	
	override method esfuerzo() = true
	
	override method broncearse() = false
	
	override method recomendadaPara(socio){
		return socio.edad().between(20,30)
	}
}

class TallerLiterario inherits Viaje{
	
	
	const libros = []
	
	method diasQueLleva(){
		return libros.size() + 1	
	}
	
	override method esfuerzo() = libros.any({l => l.nPaginas() > 500})
	
	override method broncearse() = false
	
	override method recomendadaPara(socio){
		return socio.idiomaQueHabla().size() >= 1
	}
	
}

