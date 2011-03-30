package aii.ui.graphics.border{
	import flash.display.Graphics;
	
	/**
	 * SolidBorder类为Graphics对象指定单色填充的边框。
	 * @author Swfdong
	 */
	public class SolidBorder extends GraphicFillBorder{
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
		}
	}
}