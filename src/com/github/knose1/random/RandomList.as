package com.github.knose1.random {
	/**
	 * ...
	 * @author Knose1
	 */
	public class RandomList {

		protected const OBJECTS:Vector.<Object> = new Vector.<Object>();
		protected const PROBA:Vector.<Object> = new Vector.<Object>();
		protected var totalProba:Number = 0;
		
		public function RandomList(...rest) {
			push.apply(this, rest);
			
		}
		
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
			trace(PROBA);
		}
		
		public function getRandomObject():Object {
			if (PROBA.length == 0) return undefined;
			
			var lRandom:Number = Math.random() * totalProba;
			var lLength:int = PROBA.length;
			var lBool:Boolean = true;
			
			
			for (var lI:int = 0; lBool; lI++) {
				trace(lI + "\t", PROBA[lI] + "\t", lRandom + "\t");
				lBool = lRandom > PROBA[lI];
			}
			
			return OBJECTS[lI - 1];
		}
		
	}

}