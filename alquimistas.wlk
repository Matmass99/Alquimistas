object bomba { 
	var danio = 101
	
	method efectivo(){
	 return danio > 100
		
	}
	method capacidad(){
		return danio / 2
	}
}

object pocion {
	var poderCurativo = 150
	var materialesMisticos = []
	
	method agregarMaterial(materiales){
		materialesMisticos.add(materiales)
	}
	method efectivo(){
	 return poderCurativo > 100 && self.hayMateriales()
		
		}
	method hayMateriales(){
		return self.cantidadDeMateriales() >= 0
	}
	method capacidad(){
		return poderCurativo + (self.cantidadDeMateriales() * 10)
	}
	method cantidadDeMateriales(){
		return materialesMisticos.size()
	}
	
}
object debilitadores{
	var potencia = 10
	var materiales=[]
	
	method efectivo(){
		return potencia > 0 && self.hayMateriales().negate()
	}
	method hayMateriales(){
		return self.cantidadDeMateriales() < 0
	}
	method capacidad(){
		if (self.cantidadDeMateriales() == 0){
			return 5
		}else {
			return self.cantidadDeMateriales() * 12
		}
	}
	method cantidadDeMateriales(){
		return materiales.size()
	}
	method agregarMaterial(elemento){
		materiales.add(elemento)
	}
	
}
object alquimista {
	var itemsDeCombate = []
	var itemsDeRecoleccion = #{}
	method tieneCriterio(){
		return (self.cantidadItemsDeCombate() / 2) <= self.cantidadItemsEfectivos()
	}
	method cantidadItemsDeCombate(){
		return itemsDeCombate.size()
	}
	method cantidadItemsEfectivos(){
		return itemsDeCombate.count({item => item.efectivo()})
	}
	method buenExplorador(){
		return self.cantidadItemsDeRecoleccion() >= 3
	}
	method cantidadItemsDeRecoleccion(){
		return itemsDeRecoleccion.size()
	}
	method capacidadOfensiva(){
		return itemsDeCombate.sum({item=>item.capacidad()})
	}
	
	method esProfesional(){
		return self.calidad() > 50 && self.sonTodosItemsDeCombate() && self.buenExplorador()
			
		}	
	
	method calidad(){
		return self.capacidadOfensiva() / self.cantidadItemsDeCombate()
	}
	
	method agregarItem(elemento){
		itemsDeRecoleccion.add(elemento)
	}
	method agregarItemCombate(elemento){
		itemsDeCombate.add(elemento)
	}
	method sonTodosItemsDeCombate(){
		return itemsDeCombate.all({item=> item.efectivo()})
	}
} 

object caniaDePescar {
	
	method efectivo(){
		return true
	}
}
object redParaAtraparInsectos {
	
	method efectivo(){
		return true
	}
}

object bolsaDeVientoMagica {
	
	method efectivo(){
		return true
	}
}

object material1 {
	
	method efectivo(){
		return true
	}
}

object material2 {
	
	method efectivo(){
		return true
	}
}