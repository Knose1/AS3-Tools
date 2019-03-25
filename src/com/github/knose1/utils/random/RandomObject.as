package com.github.knose1.utils.random {
	/**
	 * Object random ayant une probabilité d'être choisi
	 * @author Knose1
	 */
	public class RandomObject {
		
		public var currentObject:*;
		public var proba:Number;
		
		/**
		 * Constructeur de la class
		 * @param	pObject
		 * @param	pProba
		 */
		public function RandomObject(pObject:*, pProba:Number) {
			currentObject = pObject;
			proba = pProba;
		}
		
	}

}