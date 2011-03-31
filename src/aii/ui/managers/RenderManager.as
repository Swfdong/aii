package aii.ui.managers{
	import aii.ui.core.IRenderClient;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.Dictionary;

	/**
	 * 渲染管理器
	 * @author Swfdong
	 */
	public class RenderManager{
		/**
		 * @default 
		 */
		protected static var dispatcher:Shape=new Shape();
		/**
		 * @default 
		 */
		protected static var initialized:Boolean=false;
		/**
		 * @default 
		 */
		protected static var renderList:Dictionary=new Dictionary(true);
		/**
		 * @param client 加入渲染队列的显示对象。
		 */
		public static function add(client:IRenderClient):void{
			if(!initialized){
				dispatcher.addEventListener(Event.ENTER_FRAME,enterframeHandler,false, 0, true);
				initialized=true;
			}
			renderList[client]=true;
		}
		/**
		 * @private
		 */
		protected static function enterframeHandler(event:Event):void{
			var list:Dictionary=renderList,target:Object;
			for (target in list) {
				if(target.canValidate){
					target.validate();
					trace("A");
					delete list[target];
				}
			}
		}
	}
}