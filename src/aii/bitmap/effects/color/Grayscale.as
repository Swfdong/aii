package aii.bitmap.effects.color {
	import aii.bitmap.effects.core.*;
	import flash.filters.ColorMatrixFilter;
	import flash.display.BitmapData;

	/**
	 * 灰度化图像效果。
	 * @author Swfdong
	 */
	public class Grayscale extends FilterEffect{
		protected static const DEFAULT_FILTER:ColorMatrixFilter = new ColorMatrixFilter([ 0.3086, 0.6094, 0.0820, 0, 0, 0.3086, 0.6094, 0.0820, 0, 0, 0.3086, 0.6094, 0.0820, 0, 0, 0, 0, 0, 1, 0 ]);
		/**
		 * 创建新的灰度化效果对象。
		 * @param data 需要处理的位图数据。
		 */
		public function Grayscale(data:BitmapData=null) {
			super(data);
		}
		override protected function setupFilter():void {
			filter=DEFAULT_FILTER;
		}
	}
}