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
		tanque.disminuir(kms/10)
	}
	method velocidad(){
	      return 70 + 40.max(tanque.litrosDisponibles())
	}
}

class Ferrari inherits Vehiculo{
     override method velocidad(){
     	 return super()*3
     }
}


class Falcon inherits Vehiculo{
     override method velocidad(){
     	 return 100
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
