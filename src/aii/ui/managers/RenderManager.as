package aii.ui.managers{
	import aii.ui.core.IRenderClient;
	
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.Dictionary;

	/**
	 * RenderManager是静态工具类，用于对实现了IRenderClient接口的对象进行渲染管理。
	 * @author Swfdong
	 */
	public class RenderManager{
		protected static var dispatcher:Shape=new Shape();
		protected static var initialized:Boolean=false;
		protected static var queue:Dictionary=new Dictionary(true);
		protected static var count:uint=0;
		/**
		 * @param client 需要加入渲染队列的显示对象。
		 */
		public static function add(client:IRenderClient):void{
			if(!initialized){
				dispatcher.addEventListener(Event.ENTER_FRAME,renderHandler,false, 0, true);
				initialized=true;
			}
			if(queue[client]==undefined){
				count++;
			}
			queue[client]=true;
		}
		/**
		 * 渲染循环调用。
		 */
		protected static function renderHandler(event:Event):void{
			var target:Object;
			for (target in queue) {
				if(target.canValidate){
					target.validate();
					delete queue[target];
					count--;
				}
			}
			//如果队列中没有待渲染的对象，暂时移除事件侦听以减轻CPU占用。
			if(count==0){
				dispatcher.removeEventListener(Event.ENTER_FRAME,renderHandler);
				initialized=false;
			}
		}
	}
}