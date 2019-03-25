package com.github.knose1.utils.random {
	/**
	 * List de RandomObject qui permet de choisir aléatoirement un object
	 * @author Knose1
	 * @see RandomObject
	 */
	public class RandomList {
		
		/**
		 * Liste des objects choisi aléatoirements en fonction de leur probabilité
		 */
		protected const OBJECTS:Vector.<Object> = new Vector.<Object>();
		
		/**
		 * Liste des probabilités cummulés
		 */
		protected const PROBA:Vector.<Object> = new Vector.<Object>();
		protected var totalProba:Number = 0;
		
		/**
		 * Constructeur de la class
		 * @param	...rest
		 */
		public function RandomList(...rest) {
			push.apply(this, rest);
		}
		
		/**
		 * Ajoute un ou plusieurs éléments dans la liste de RandomObject;
		 * @param	...rest 
		 * @throws ...rest[<i>index</i>] is not a RandomObject
		 */
		public function push(...rest):void {
			var lRestLength:int = rest.length;
			if (lRestLength == 0) return;
			
			var lProba:Number = totalProba;
			var lRest:Object;
			
			for (var lI:int = 0; lI < lRestLength; lI++) {
				lRest = rest[lI];
				if (!(lRest is RandomObject)) {
					throw new TypeError("...rest[" + lI + "] is not a RandomObject").getStackTrace();
					return;
				}
				
				OBJECTS.push(lRest.currentObject);
				
				lProba += lRest.proba || 0;
				
				if (lRestLength - 1 == lI) {
					totalProba = lProba;
				}

				PROBA.push(lProba);
				
			}
		}
		
		/**
		 * Choisi et retourne un object choisi aléatoirement en fonction de sa probabilité
		 * @return L'object choisi aléatoirement
		 */
		public function getRandomObject():* {
			if (PROBA.length == 0) return undefined;
			
			var lRandom:Number = Math.random() * totalProba;
			var lLength:int = PROBA.length;
			var lBool:Boolean = true;
			
			
			for (var lI:int = 0; lBool; lI++) {
				lBool = lRandom > PROBA[lI];
			}
			
			return OBJECTS[lI - 1];
		}
		
	}

}
