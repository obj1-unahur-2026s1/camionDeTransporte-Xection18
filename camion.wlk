object camion {
    const cosasCargadas = []

    method cargar(cosa) {
        cosasCargadas.add(cosa)
    }

    method descargar(cosa) {
        cosasCargadas.remove(cosa)
    }

    method peso() {
      return 1000 + cosasCargadas.sum({cosa => cosa.peso()})
    }

    method todosLosPesosSonPares() {
        return cosasCargadas.all({cosa => cosa.peso().even()})
    }

    method hayCosaQuePesa(unPeso) {
      return cosasCargadas.any({cosa => cosa.peso() == unPeso})
    }

    method primerCosaConPeligrosidad(unNivel) {
      return cosasCargadas.findOrDefault({cosa => cosa.nivelDePeligrosidad() == unNivel}, "No se encontró ninguna cosa")
    }

    method cosasQueSuperanNivelDePeligrosidad(unNivel) {
        return cosasCargadas.filter({cosa => cosa.nivelDePeligrosidad() > unNivel})
    }

    method cosasQueSuperanNivelDePeligrosidadDe(unaCosa) {
        return self.cosasQueSuperanNivelDePeligrosidad(unaCosa.nivelDePeligrosidad())
    }

    method estaExcedidoDePeso() {
      return self.peso() >  2500
    }

    method puedeCircularEnRuta(nivelMaximo) {
      return not self.estaExcedidoDePeso() and self.cosasQueSuperanNivelDePeligrosidad(nivelMaximo).isEmpty()
    }

    method algunaCargaPesaEntre(min, max) = cosasCargadas.any({cosa => cosa.peso().between(min, max)}) 

    method cosaMasPesada() {
        return cosasCargadas.max({cosa => cosa.peso()})
    }
}