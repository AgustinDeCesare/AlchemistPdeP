/*

object material{
	var calidad
	method materialMistico(){
		
	}	
}

object recoleccion{
	var materiales = []
}
*/

object alquimista{
	var itemsDeCombate = []
	var itemsDeRecoleccion = []
	method tieneCriterio(){
		return self.cantidadDeItemsDeCombateEfectivos() >= self.cantidadDeItemsDeCombate()/2
	}
	method cantidadDeItemsDeCombate(){
		return itemsDeCombate.size()
	}
	method cantidadDeItemsDeCombateEfectivos(){
		return itemsDeCombate.filter({itemDeCombate => itemDeCombate.esEfectivo()}).size()
	}
	method agregarItem(item){
		itemsDeCombate.add(item)
	}
	method esBuenExplorador(){
		return self.cantidadDeItemsDeRecoleccion() >= 3
	}
	method cantidadDeItemsDeRecoleccion() {
		return itemsDeRecoleccion.size()
	}
	method agregarItemDeRecoleccion(item){
		itemsDeRecoleccion.add(item)
	}
	method capacidadOfensiva(){
		return itemsDeCombate.sum({item => item.capacidadOfensiva()})
	}
}	

object bomba{
	var materiales = []
	var danio = 150
	method esEfectivo(){
		return danio > 100
	}
	method calidad(){
		return materiales.min({material => material.calidad()})
	}
	method capacidadOfensiva(){
		return danio / 2
	}
}

object pocion{
	var materiales = []
	var poderCurativo = 25
	method esEfectivo(){
		return poderCurativo > 50 && self.fueCreadaConMaterialMistico()
	}
	method fueCreadaConMaterialMistico(){
		return materiales.any({material => material.esMistico()})
	}
	method capacidadOfensiva(){
		return poderCurativo + 10 * self.cantidadDeMaterialesMisticos()
	}
	method cantidadDeMaterialesMisticos(){
		return materiales.count({material => material.esMistico()})
	}
}

object debilitador{
	var materiales = []
	var potencia = 0
	method esEfectivo(){
		return potencia > 50 && not self.fueCreadaConMaterialMistico()
	}
	method fueCreadaConMaterialMistico(){
		return materiales.any({material => material.esMistico()})
	}
}
