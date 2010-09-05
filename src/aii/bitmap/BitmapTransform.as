package aii.bitmap{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Matrix;
	/**
	 * 位图图像变形类。
	 * @author Swfdong
	 */
	public class BitmapTransform{
		protected static var ZEROPOINT:Point = new Point(0, 0);
		/**
		 * 缩放位图。
		 * @param data 需要处理的位图数据。
		 * @param width 缩放后位图的宽度。
		 * @param height 缩放后位图的高度。
		 * @return 处理后的位图。
		 */
		public function resize(data:BitmapData, width:uint, height:uint):BitmapData {
			var result:BitmapData = new BitmapData(width, height, data.transparent);
			result.draw(data, new Matrix(width / data.width, 0, 0, height / data.height, 0, 0));
			return result;
		}
	}
}