package com.github.knose1.utils.error {
	/**
	 * ...
	 * @author Knose1
	 */
	public class Warning extends Error {
		
		public function Warning(message:*="", id:*=0) {
			super(message, id);
			name = "Warning";
		}
		
	}

}