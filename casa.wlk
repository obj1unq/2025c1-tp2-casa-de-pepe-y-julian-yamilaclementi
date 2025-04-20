import cosas.* 

object casaDePepeYJulian {

    const property cosas = [] // Es const porque lo que va a ir cambiando es lo que esta dentro de la lista. 

    method comprar(cosa) {
        cosas.add(cosa)        //.add para ir agregando "cosa" a la lista
    }

    method cantidadDeCosasCompradas() { //consulta
        return cosas.size()
    }

    method tieneAlgun(categoria) { //consulta
        return cosas.any({cosa => cosa.categoria() == categoria}) //.any algun
    }

    method vieneDeComprar(categoria) { //consulta
        return self.ultimaCosaComprada().categoria() == categoria 
    }

    method ultimaCosaComprada() {
        return cosas.last() // .last para el ultimo agregado
    }

    method esDerrochona() {
        return cosas.sum({cosa => cosa.precio() >= 9000}) //.sum para sumar todo
    }

    method compraMasCara() {
        return cosas.max({cosa => cosa.precio()}) //.max para devolver el mas grande
    }

    method comprados(categoria) {
        return cosas.filter({cosa => cosa.categoria() == categoria}) // .filter para filtrar con una condición
    }

    method malaEpoca() {
        return cosas.all({cosa => cosa.categoria().esUnAlimento()}) // .all para ver si todo cumple con lo pedido
    }

    method queFaltaComprar(lista) {
        return lista.filter({cosa => not cosas.contains(cosa)})
    }

    method faltaComida() {
        return cosas.count({cosa => cosa.categoria() == comida} < 2) // .count para contar los elemt que cumplen
    }

    method  categoriasCompradas() {
        return cosas.map({cosa =>  cosa.categoria()}).asSet()  //.asSet para eliminar duplicados 
    }
}

object cuentaCorriente {
    
    var property saldo = 0

    method depositar(cantidad) {
        saldo = saldo + cantidad
    }

    method extraer(cantidad) {
        self.validarExtraccion(cantidad) //Tengo que validar si hay cantidad disponible
        saldo = saldo - cantidad
    }

    method validarExtraccion(cantidad) {
        if (saldo < cantidad) {
        self.error("No puede realizar la extraci+on, saldo insuficiente!")
        }
    }
}

object cuentaConGastos {
    
    var property saldo = 0
    var property costoDeOperacion = 0

    method depositar(cantidad) {
        self.validarDeposito(cantidad) // Tengo que validar si el valor es mayor a 1000
        saldo = saldo + cantidad - self.costoDeOperacion()
    }
    
    method validarDeposito(cantidad) {
		if (cantidad > 1000) {
			self.error("No puede realizar depositos mayor a 1000")
		}
	}

    method extraer(cantidad) {
        saldo = saldo - cantidad 
    }
}