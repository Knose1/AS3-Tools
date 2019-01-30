package com.github.knose1.async {
	/**
	 * Create an async function
	 * 
	 * @example Simple promise example
	 * <codeblock xml:space="preserve" class="+ topic/pre pr-d/codeblock ">
	 * new Promise(promiseFunction)
	 * 	.then(promiseThen)
	 * 	.handleCatch(promiseCatch)
	 * 	.finaly(promiseFinal);
	 * 	
	 * function promiseFunction(pResolve:Function, pReject:Function):void {
	 * 	trace("main");
	 * 		
	 * 	function lCountCallback(pEvent:FrameCounterEvent):void {
	 * 		pResolve();
	 * 	}
	 * 		
	 * 	var lCounter:FrameCounter = new FrameCounter(stage, 100, 1);
	 * 	lCounter.addEventListener(FrameCounterEvent.TIMER_COMPLETE, lCountCallback);
	 * 	lCounter.start();
	 * }
	 * 
	 * function promiseThen():void {
	 * 	trace("then");
	 * }
	 * 	
	 * function promiseCatch(pError:Error = null):void {
	 * 	trace("catch");
	 * }
	 * 	
	 * function promiseFinal():void {
	 * 	trace("final");
	 * }
	 * </codeblock>
	 *
	 * @author Knose1
	 */
	public class Promise {
		
		protected var _argsThen:Array;
		protected var _argCatch:Error;
		
		protected var _callbackThen :Function = null;
		protected var _callbackCatch:Function = null;
		protected var _callbackFinal:Function = null;
		
		protected var _isPromiseResolved:Boolean = false;
		protected var _isPromiseRejected:Boolean = false;
		protected var _isPromiseFinished:Boolean = false;
		
		protected var _isFunctionThenCalled :Boolean = false;
		protected var _isFunctionCatchCalled:Boolean = false;
		protected var _isFunctionFinalCalled:Boolean = false;
		
		/**
		 * Constructor
		 * @param	pCallback : <p>A function with the arguments pResolve:Function and pReject:Function.</p>
		 * <code>function myCallBack(pResolve:Function, pReject:Fuction):void {}</code>
		 */
		public function Promise(pCallback:Function) {
			pCallback.call(null, _resolve, _reject);
		}
		
		
		/* ----------------------- */
		
		
		/**
		 * Call the pCallback function when the promise is resolved
		 * @param	pCallback
		 * @return
		 */
		public function then(pCallback:Function):Promise {
			_callbackThen = pCallback;
			callThen();
			
			return this;
		}
		
		
		/**
		 * Call the pCallback function when the promise is rejected
		 * @param	pCallback
		 * @return
		 */
		public function handleCatch(pCallback:Function):Promise {
			_callbackCatch = pCallback;
			callCatch();
			
			return this;
		}
		
		
		/**
		 * Call the pCallback function whenever the promise is rejected or resolved
		 * @param	pCallback
		 * @return
		 */
		public function finaly(pCallback:Function):Promise {
			_callbackFinal = pCallback;
			callFinal();
			
			return this;
		}
		
		
		/* ----------------------- */
		
		
		/**
		 * @param	...rest The args of the _thenCallback function
		 */
		protected function _resolve(...rest):void {
			if (!_isPromiseFinished) {
				_isPromiseFinished = true;
				_isPromiseResolved = true;
			}
			
			if (!_argsThen) _argsThen = rest;
			
			callThen();
			callFinal();
		}
		
		/**
		 * @param pError The reason for rejecting the promise
		 */
		protected function _reject(pError:Error = null):void {
			if (!_isPromiseFinished) {
				_isPromiseFinished = true;
				_isPromiseRejected = true;
			}
			
			if (!_argCatch) _argCatch = pError;
			
			callCatch()
			callFinal();
		}
		
		
		/* ----------------------- */
		
		
		private function callThen():void {
			if (!_isPromiseResolved || _isFunctionThenCalled || _callbackThen  == null) return;
			
			_isFunctionThenCalled = true;
			_callbackThen.apply(null, _argsThen);
		}
		
		private function callCatch():void {
			if (!_isPromiseRejected || _isFunctionCatchCalled || _callbackCatch  == null) return;
			
			_isFunctionCatchCalled = true;
			_callbackCatch.call(null, _argCatch);
			
		}
		
		private function callFinal():void {
			if (!_isPromiseFinished || _isFunctionFinalCalled || _callbackFinal  == null) return;
			
			_isFunctionFinalCalled = true;
			_callbackFinal();
			
		}
	}

}