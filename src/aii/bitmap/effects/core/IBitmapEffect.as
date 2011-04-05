package aii.bitmap.effects.core {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	/**
	 * IBitmapEffect接口定义了位图效果的接口。
	 * @author Swfdong
	 */
	public interface IBitmapEffect{
		/**
		 * 应用效果到位图。
		 * @param data 要使用的输入位图图像。
		 * @param rect 定义要用作输入的源图像区域的矩形。
		 * @param dest 目标图像中与源矩形的左上角对应的点。
		 */
		function apply(data:BitmapData,rect:Rectangle=null,dest:Point=null):void;
	}
}