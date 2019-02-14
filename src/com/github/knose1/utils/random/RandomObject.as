package com.github.knose1.utils.random {
	/**
	 * Object random ayant une probabilité d'être choisi
	 * @author Knose1
	 */
	public class RandomObject {
		
		public var currentObject:Object;
		public var proba:Number;
		
		/**
		 * Constructeur de la class
		 * @param	pObject
		 * @param	pProba
		 */
		public function RandomObject(pObject:Object, pProba:Number) {
			currentObject = pObject;
			proba = pProba;
		}
		
	}

}