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
		public const LIST:Vector.<RandomObject> = new Vector.<RandomObject>();
		
		
		/**
		 * Constructeur de la class
		 * @param	...rest
		 */
		public function RandomList(...rest) {
			push.apply(this, rest);
		}
		
		
		/**
		 * Choisi et retourne un RandomObject choisi aléatoirement en fonction de sa probabilité
		 * @return L'object choisi aléatoirement
		 */
		public function getRandomRandomObject():RandomObject {
			var lLength:uint = LIST.length;
			if (lLength == 0) return null;
			
			var lProba:Number = 0;
			
			var lRandom:Number = Math.random() * getTotalProba();
			var lBool:Boolean = true;
			
			for (var lI:int = 0; lBool; lI++) {
				lBool = lRandom > (lProba += LIST[lI].proba);
			}
			
			return LIST[lI - 1];
		}
		
		/**
		 * Choisi et retourne un object choisi aléatoirement en fonction de sa probabilité
		 * @return L'object choisi aléatoirement
		 */
		public function getRandomObject():* {
			var lObject:RandomObject = getRandomRandomObject();
			
			if (lObject == null) return undefined
			
			return lObject.currentObject;
		}
		
		/**
		 * Fonction qui retourne la somme des probabilités
		 */
		public function getTotalProba():Number {
			var lToReturn:Number = 0;
			for (var i:int = LIST.length - 1 ; i >= 0; i--) {
				lToReturn += LIST[i].proba;
			}
			
			return lToReturn;
		}
		
		
		
		
		/* DELEGATE Vector.<T> */
		//{
		public function get length():int {
			return LIST.length;
		}
		
		public function set length(value:int):void {
			LIST.length = value;
		}
		
		public function shift():com.github.knose1.utils.random.RandomObject {
			return LIST.shift();
		}
		
		public function unshift(...rest):uint {
			return LIST.unshift.apply(null, rest);
		}
		
		public function push(...rest):uint {
			return LIST.push.apply(this, rest);
		}
		
		public function pop():RandomObject {
			return LIST.pop();
		}
		
		public function toString():String {
			return LIST.toString();
		}
		
		public function removeAt(index:int):RandomObject {
			var lObject = LIST.removeAt(index);
			return RandomObject(lObject);
		}
		//}
		
		/**
		 * Retire un ou plusieurs éléments dans la liste de RandomObject;
		 * @param	...rest 
		 */
		public function remove(...rest):void {
			var lItem:Object;
			var lIndex:uint = 0;
			
			while (rest.length > 0 && (lItem = rest.pop())) {
				if (lItem is RandomObject && (lIndex = LIST.indexOf(lItem)) > -1) {
					LIST.removeAt(lIndex);
				}
			}
		}
	}

}
