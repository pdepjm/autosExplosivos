class NaftaInsuficienteException inherits Exception {}
class BateriaInsuficienteException inherits Exception {}
class AceiteException inherits Exception {}

class Conductor {
	var auto
	var cantCargasBotella = 10
	
	method viajar(kms){
		try { 
			auto.encender()
		} catch e: AceiteException {
			auto.cargarAceite(10)
			cantCargasBotella -= 1
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
	
	method velocidad() //te garantizo que mis subclases lo redefinen
	
}

class Camioneta inherits Vehiculo{
     var cantidadDeAsientos
     
     override method velocidad() {
     	return cantidadDeAsientos*15
     }
     
     method cantidadDeAsientos()= cantidadDeAsientos
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
		bateria.disminuir(10);
     	super(kms)
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
	var litrosDisponibles= 0
	method disminuir(litros){
		if (litrosDisponibles < litros) {
			throw new NaftaInsuficienteException("No hay nasta")
		}
		litrosDisponibles -= litros
	}
}

class Bateria {
	var kwActuales = 80
	method disminuir(kw){
		if (kw > kwActuales){
			throw new BateriaInsuficienteException()
		}	
		kwActuales -= kw
	}
} 


