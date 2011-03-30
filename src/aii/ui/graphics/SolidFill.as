package aii.ui.graphics{
	import aii.utils.ObjectUtil;
	import flash.display.Graphics;
	/**
	 * SolidFill类为Graphics对象指定单色填充。
	 * @author Swfdong
	 */
	public class SolidFill implements IGraphicFill{
		/**
		 * 填充的颜色值。
		 * @default 0x000000
		 */
		public var color:uint=0x0;
		/**
		 * 填充的alpha透明度值。
		 * @default 1
		 */
		public var alpha:Number=1;
		/**
		 * 创建一个新的SolidFill实例。
		 * @param args 实色填充的参数。
		 */
		public function SolidFill(args:Object){
			ObjectUtil.mergeTo(this,args);
		}
		public function beginFill(target:Graphics, width:Number, height:Number):void{
			target.beginFill(color,alpha);
		}
		public function endFill(target:Graphics):void{
			target.endFill();
		}
	}
}