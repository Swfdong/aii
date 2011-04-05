package aii.ui.graphics.border{
	import aii.ui.graphics.*;
	import aii.ui.factory.GraphicFactory;
	import aii.utils.ObjectUtil;
	
	import flash.display.Graphics;
	/**
	 * SolidBorder类为Graphics对象指定单层实线填充的边框。
	 * @author Swfdong
	 */
	public class SolidBorder implements IGraphicBorder{
		/**
		 * 边框的色彩填充。
		 * @default null
		 */
		public var fill:IGraphicFill=null;
		/**
		 * 边框的粗细，以像素为单位。
		 * @default 1
		 */
		public var weight:uint = 1;
		/**
		 * 边角的圆角半径，以像素为单位。
		 * @default 0
		 */
		public var radius:Number = 0;
		/**
		 * 创建一个新的SolidBorder实例。
		 * @param args 边框的参数。
		 */
		public function SolidBorder(args:Object){
			ObjectUtil.mergeTo(this,args);
		}
		public function draw(target:Graphics, x:Number, y:Number,width:Number, height:Number,shape:IGraphicShape,sorb:uint=0):void{
			if(weight>0){
				//绘制边框
				fill.beginFill(target,width,height);
				shape.draw(target,x, y, width, height,radius,sorb);
				shape.draw(target,x+weight, y+weight, width-(weight<<1), height-(weight<<1),radius-weight,sorb);
				fill.endFill(target);
			}
		}
	}
}