
class Conductor {
	var auto
	
	method viajar(kms){
		auto.encender()
		auto.andar(kms)
	}
	
}

class Vehiculo {
	var motor
	var tanque
	var bateria
	method encender(){
		bateria.disminuir(1)
		tanque.disminuir(0.1)
		motor.chequearAceite()
	}
}


class Motor {
	var porcentajeAceite = 100
	method chequearAceite(){
		
	}
}

class Tanque {
	var litrosDisponibles
	method disminuir(litros){
		
	}
}

class Bateria {
	var kwActuales
	method disminuir(kw){
	
	}
} 


