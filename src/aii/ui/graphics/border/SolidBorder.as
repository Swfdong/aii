package aii.ui.graphics.border{
	import flash.display.Graphics;
	
	/**
	 * SolidBorder类为Graphics对象指定单色填充的边框。
	 * @author Swfdong
	 */
	public class SolidBorder extends GraphicFillBorder{
		/**
		 * 边框的颜色值。
		 * @default 0x000000
		 */
		public var color:uint=0x0;
		/**
		 * 边框的alpha透明度值。
		 * @default 1
		 */
		public var alpha:Number=1;
		/**
		 * 创建一个新的SolidBorder实例。
		 * @param color 边框的颜色值。
		 * @param alpha 边框的alpha透明度值。
		 */
		public function SolidBorder(color:uint,alpha:Number=1.0){
			this.color=color;
			this.alpha=alpha;
		}
		override protected function beginFill(target:Graphics,width:Number,height:Number):void{
			target.beginFill(color,alpha);
		}
	}
}