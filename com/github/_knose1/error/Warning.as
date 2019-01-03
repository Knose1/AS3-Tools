package com.github._knose1.error {
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