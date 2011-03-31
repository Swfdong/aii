package aii.ui.graphics.border{
	import aii.ui.managers.GraphicManager;
	import aii.ui.graphics.*;
	
	import flash.display.Graphics;
	/**
	 * SolidBorder类为Graphics对象指定双层实线填充的边框。
	 * @author Swfdong
	 */
	public class DoubleBorder extends BaseBorder{
		/**
		 * 边框间隙。
		 * @default 0
		 */
		public var space:uint=0;
		/**
		 * 内层色彩填充。
		 * @default null
		 */
		public var innerBorder:SolidBorder=null;
		/**
		 * 创建一个新的DoubleBorder实例。
		 * @param args 边框的参数。
		 */
		public function DoubleBorder(args:Object){
			super(args);
		}
		override public function draw(target:Graphics, width:Number, height:Number,drawFill:IGraphicFill=null,x:Number=0, y:Number=0,needFill:Boolean=true):void{
			super.draw(target, width, height,drawFill,x, y,needFill);
			if(needFill){
				innerBorder.draw(target, width-leftWeight-rightWeight-(space<<1), height-topWeight-bottomWeight-(space<<1),drawFill,x+leftWeight-space, y+topWeight+space);
			}
		}
	}
}