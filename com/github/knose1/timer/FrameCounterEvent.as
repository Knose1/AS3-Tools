package com.github.knose1.timer {
	import flash.events.Event;
	
	/**
	 * Une liste d'event pour la classe FrameCounter
	 * @author Knose1
	 */
	public class FrameCounterEvent extends Event {
		
		/**
		 * Constante qui définie le type d'un object FrameCounterEvent timer <br>
		 * Description de l'event : Distribué lorsqu’un objet FrameCounter atteint un intervalle spécifié conformément à la propriété FrameCounter.delay.
		 */
		static public const TIMER:String = "timer";
		
		/**
		 * Constante qui définie le type d'un object FrameCounterEvent timerComplete <br>
		 * Description de l'event : Distribué lorsque le traitement du nombre de requêtes défini par Timer.totalLoop est terminé.
		 */
		static public const TIMER_COMPLETE:String = "timerComplete";
		
		/**
		 * Constante qui définie le type d'un object FrameCounterEvent tick <br>
		 * Description de l'event : Distribué à chaque appel de gotoNextFrame.
		 */
		static public const TICK:String = "tick";
		
		public function FrameCounterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) { 
			super(type, bubbles, cancelable);
		} 
		
		public override function clone():Event { 
			return new FrameCounterEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String { 
			return formatToString("FrameCounterEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}
