import cargas.*
import transporte.*

object transportistas {

	var transporte = camionMoyano
	var deposito = []

	method recibirCosas(algos) {
		deposito.addAll(algos)
	}
	method tenesCargado(algo) {
		return deposito.contains(algo)
	}
	
	// TODO como resolves el caso de la motoneta?
	// me parece que lo mejor sería que el transporte a cargar venga por parámetro
	// así podes mandar uno, o el otro
	method llenarElCamion(algo) {
		deposito.forEach({ cam =>
			if (transporte.puedeAceptar()) cam.cargar(algo)
			// TODO esto debería estar ADENTRO del test, sino hace esto SIEMPRE
			// y sólo debería descargar en el caso de que se pudo cargar en el transporte
			self.descargarDeposito(algo)
		})
	}

	method descargarDeposito(algo) {
		deposito.remove(algo)
	}

}

