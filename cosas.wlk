object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
}

object bumblebee {
    var formaActual = auto

    method cambiarForma(unaForma) {
        formaActual = unaForma
    }

    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel()
}

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 10

    method peso() = 2 * cantidadDeLadrillos
    method nivelDePeligrosidad() = 2
    method cambiarCantidad(unaCantidad) {
      cantidadDeLadrillos = unaCantidad
    }
}

object arena {
    var property peso = 10

    method nivelDePeligrosidad() = 1
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
}

object residuos {
    var property peso = 10
    method nivelDePeligrosidad() = 200
}

object embalaje {
    var property cosaEnvuelta = bateria

    method peso() = self.cosaEnvuelta().peso()
    method nivelDePeligrosidad() = self.cosaEnvuelta().nivelDePeligrosidad() / 2
}

object auto {
    method nivel() = 15
}

object robot {
    method nivel() = 30
}