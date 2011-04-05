package aii.bitmap.effects.core {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 滤镜效果基类，创建自定义位图效果请继承自此类。
	 * @author Swfdong
	 */
	public class BitmapEffect implements IBitmapEffect {
		protected const ZEROPOINT:Point=new Point(0,0);
		public function BitmapEffect(data:BitmapData = null) {
			if (data != null) {
				apply(data);
			}
		}
		public function apply(data:BitmapData, rect:Rectangle = null, dest:Point = null):void {
		}
	}
}