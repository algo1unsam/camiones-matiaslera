import empresa.*
import cargas.*

object camionMoyano {

	var cargas = []
	var property cargaMaxima = 1000
	var ruta = panamericana

	method cargar(algo) {
		if (self.puedeAceptar(algo)) cargas.add(algo)
	}

	method descargar(algo) {
		cargas.remove(algo)
	}

	method tenesCargado(algo) {
		return cargas.contains(algo)
	}

	method cargaActual() {
		return cargas.sum({ peso => peso.peso() })
	}

	method cargaDisponible() {
		return cargaMaxima - self.cargaActual()
	}

	method puedeAceptar(algo) {
		return algo.peso() < self.cargaDisponible()
	}

	method cargaMasPeligrosa() {
		return cargas.max({ carga => carga.nivelDePeligrosidad() })
	}

	method puedeCircularPor() {
		return ruta.nivelDePeligrosidad() > self.cargaMasPeligrosa().nivelDePeligrosidad()
	}
	
	

}

object motoneta {

	var cargas = []
	var property cargaMaxima = 1000
	var ruta = panamericana

	method cargar(algo) {
		if (self.puedeAceptar(algo)) cargas.add(algo)
	}

	method puedeAceptar(algo) {
		return algo.nivelDePeligrosidad() < 5
	}

}

object panamericana {

	var property nivelDePeligrosidad = 10

}

