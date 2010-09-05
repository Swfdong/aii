package aii.bitmap.effects.core {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 滤镜效果基类，创建自定义位图效果请继承自此类。
	 */
	public class BitmapEffect implements IBitmapEffect {
		protected const ZEROPOINT:Point=new Point(0,0);
		public function BitmapEffect(data:BitmapData = null) {
			if (data != null) {
				apply(data);
			}
		}

		/**
		 * 应用效果到位图。
		 * @param data 要使用的输入位图图像。
		 * @param rect 定义要用作输入的源图像区域的矩形。
		 * @param dest 目标图像中与源矩形的左上角对应的点。
		 */
		public function apply(data:BitmapData, rect:Rectangle = null, dest:Point = null):void {
		}
	}
}