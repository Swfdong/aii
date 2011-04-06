package aii.ui.graphics.border{
	import aii.ui.factory.GraphicFactory;
	import aii.ui.graphics.*;
	
	import flash.display.Graphics;
	/**
	 * DoubleBorder类为Graphics对象指定双层实线填充的边框。
	 * @author Swfdong
	 */
	public class DoubleBorder extends SolidBorder{
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
		override public function draw(target:Graphics, x:Number, y:Number,width:Number, height:Number,shape:IGraphicShape,sorption:uint=0):void{
			super.draw(target, x,y,width, height,shape,sorption);
			innerBorder.draw(target, x+weight-space, y+weight+space,width-((weight+space)<<1), height-((weight+space)<<1),shape,sorption);
		}
	}
}