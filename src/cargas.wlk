import empresa.*
import transporte.*

object knightRider {

	var property peso = 500
	var property nivelDePeligrosidad = 10

}

object bumblebee {

	const peso = 800
	var transformacion = auto

	method transformar(algo) {
		transformacion = algo
	}

	method nivelDePeligrosidad() {
		return transformacion.peligrosidad()
	}

}

object auto {

	var property peligrosidad = 15

}

object robot {

	var property peligrosidad = 30

}

object paqueteDeLadrillos {

	const nivelDePeligrosidad = 2
	var property pesoLadrillo = 2
	var property cantidadLadrillo = 1

	method peso (){
		return pesoLadrillo * cantidadLadrillo
	}
}

object contenedorPortuario {
	var property peso = 100 + self.cargaActual()
	var productos = []
	
	method cargar(algo) {
		productos.add(algo)
	}
	
	method cargaActual() {
		return productos.sum({ prod => prod.peso() })
	}
	
	method nivelDePeligrosidad(){
	if(productos==null)return 0 else	return productos.max({ prod => prod.nivelDePeligrosidad() })
	}

}
object embalajeDeSeguridad{
	var productoEnvuelto= []
	
	method nivelDePeligrosidad(){
		return productoEnvuelto.max({ prodEnv => prodEnv.nivelDePeligrosidad()})/2
	}
	
	method peso() {
		return productoEnvuelto.sum({ pesoProd => pesoProd.peso() })
	}
}

