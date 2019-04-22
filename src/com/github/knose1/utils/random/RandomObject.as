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
		
		public function toString():String {
			return "[RandomObject currentObject=" + currentObject + " proba=" + proba + "]";
		}
		
		public function clone():RandomObject {
			return new RandomObject(currentObject, proba);
		}
		
	}

}