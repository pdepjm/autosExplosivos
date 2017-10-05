class Conductor {
	var auto
	
	method viajar(kms){
		try {
			auto.encender()
		} catch e : AceiteException {
			
		}
		auto.andar(kms)
	}
	
}

class Auto {
	var motor
	var tanque
	var bateria
	method encender(){
		bateria.disminuir(1)
		tanque.disminuir(0.1)
		motor.chequearAceite()
	}
	method andar(kms){
		tanque.disminuir(kms/10)
	}
}


class Motor {
	var porcentajeAceite = 100
	method chequearAceite(){
		if (porcentajeAceite < 70) {
			throw new AceiteException()
		}
	}
}

class Tanque {
	var litrosDisponibles
	method disminuir(litros){
		if (litros > litrosDisponibles){
			throw new NaftaInsuficienteException()
		}
		litrosDisponibles -= litros
	}
}

class Bateria {
	var kwActuales
	method disminuir(kw){
		if (kw > kwActuales){
			throw new BateriaInsuficienteException()
		}
		kwActuales -= kw
	}
} 

class AceiteException inherits Exception {}
class BateriaInsuficienteException inherits Exception {}
class NaftaInsuficienteException inherits Exception {}