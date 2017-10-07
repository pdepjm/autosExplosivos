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

class Vehiculo {
	var motor
	var tanque
	var bateria
	method encender(){
		bateria.disminuir(1)
		tanque.disminuir(0.1)
		motor.chequearAceite()
	}
	method andar(kms){
		tanque.disminuir(kms/self.velocidad())
	}
	method velocidad()
}

class Ferrari inherits Vehiculo{
     override method velocidad(){
     	 return 120;
     }
}


class Falcon inherits Vehiculo{
     override method velocidad(){
     	 return 100
     }
     override method andar(kms){
     	super(kms)
	bateria.disminuir(10);
     }
}

class Camioneta inherits Vehiculo{
     var cantidadDeAsientos
     
     override method velocidad() {
     	return cantidadDeAsientos*15
     }
     
     method cantidadDeAsientos()= cantidadDeAsientoss
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
		},
		litrosDisponibles -= litros
	}
	method litrosDisponibles() = litrosDisponibles
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
