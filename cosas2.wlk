object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10

    method bultos() {
        return 1
    }
    method consecuenciaDeLaCarga() {
      
    }
}

object bumblebee {
    var formaActual = auto

    method bultos() {
        return 2
    }

    method cambiarForma(unaForma) {
        formaActual = unaForma
    }

    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel()

    method consecuenciaDeLaCarga() {
        self.cambiarForma(robot)
    }
}

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 10

    method peso() = 2 * cantidadDeLadrillos
    method nivelDePeligrosidad() = 2
    method cambiarCantidad(unaCantidad) {
      cantidadDeLadrillos = unaCantidad
    }

    method bultos() {
        if (cantidadDeLadrillos <= 100) {
            return 1
        } else if (cantidadDeLadrillos.between(101, 300)){
            return 2
        } else {
            return 3
        }
    }

    method consecuenciaDeLaCarga() {
        cantidadDeLadrillos =+ 12
    }
}

object arena {
    var property peso = 10

    method nivelDePeligrosidad() = 1

    method bultos() {
        return 1
    }

    method consecuenciaDeLaCarga() {
        peso = (peso-10).max(0)
    }
}

object bateria {
    var property estaConMisiles = false

    method peso() {
        if (estaConMisiles) {
            return 300
        }
        else {
            return 200
        }
    }

    method nivelDePeligrosidad() {
        if (estaConMisiles) {
            100
        }
        else {
            0
        }
    }

    method bultos() {
        if (estaConMisiles) {
            return 2
        } else {
            return 1
        }
    }

    method consecuenciaDeLaCarga() {
        estaConMisiles = true
    }
}

object contenedor {
    const cosasContenidas = []

    method agregarCosa(cosa) {
        cosasContenidas.add(cosa)
    }

    method agregarCosas(listaDeCosas) {
        cosasContenidas.addAll(listaDeCosas)
    }

    method removerCosa(cosa) {
        cosasContenidas.remover(cosa)
    }

    method removerCosas(listaDeCosas) {
        cosasContenidas.removeAll(listaDeCosas)
    }

    method peso() = 100 + self.pesoDeCosasContenidas()
    method nivelDePeligrosidad() {
        if (not cosasContenidas.isEmpty()) {
            return self.cosaContenidaMasPeligrosa().nivelDePeligrosidad()
        } else {
            return 0
        }
    }
    method pesoDeCosasContenidas() {
        return cosasContenidas.sum({cosa => cosa.peso()})
    }

    method cosaContenidaMasPeligrosa() {
        return cosasContenidas.max({cosa => cosa.nivelDePeligrosidad()})
    }

    method bultos() {
        return 1 + self.bultosDeCosasContenidas()
    }

    method bultosDeCosasContenidas() = cosasContenidas.sum({cosa => cosa.bultos()})
    method consecuenciaDeLaCarga() {
        cosasContenidas.forEach({cosa => cosa.consecuenciaDeLaCarga()})
    }
}

object residuos {
    var property peso = 10
    method nivelDePeligrosidad() = 200
    method bultos() {
        return 1
    }

    method consecuenciaDeLaCarga() {
        peso =+ 15
    }
}

object embalaje {
    var property cosaEnvuelta = bateria

    method bultos() {
        return 2
    }

    method peso() = self.cosaEnvuelta().peso()
    method nivelDePeligrosidad() = self.cosaEnvuelta().nivelDePeligrosidad() / 2

    method consecuenciaDeLaCarga() {
    }
}

object auto {
    method nivel() = 15
}

object robot {
    method nivel() = 30
}