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
	method llenarElCamion(algo) {
		deposito.forEach({ cam =>
			if (transporte.puedeAceptar()) cam.cargar(algo)
			self.descargarDeposito(algo)
		})
	}

	method descargarDeposito(algo) {
		deposito.remove(algo)
	}

}

