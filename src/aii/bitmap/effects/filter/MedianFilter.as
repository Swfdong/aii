package aii.bitmap.effects.filter {
	import aii.bitmap.effects.core.FilterEffect;
	import flash.display.BitmapData;

	/**
	 * 使用PixelBender实现的中值滤波器。
	 * @author Swfdong
	 */
	public class MedianFilter extends FilterEffect {
		[Embed('../../../../../data/MedianFilter3x3.pbj', mimeType='application/octet-stream')]
		private static const FILTER3x3:Class;
		[Embed('../../../../../data/MedianFilter5x5.pbj', mimeType='application/octet-stream')]
		private static const FILTER5x5:Class;
		private var _size:uint = 3;

		/**
		 * 创建新的中值滤波器对象。
		 * @param data 要使用的输入位图图像。
		 * @param size 指定的中值滤波器尺寸。
		 */
		public function MedianFilter(data:BitmapData = null, size:uint = 3) {
			this.size = size;
			super(data);
		}

		override protected function setupFilter():void {
			if (size == 3) {
				setupFilterByClass(FILTER3x3);
			} else {
				setupFilterByClass(FILTER5x5);
			}
		}

		/**
		 * @return 当前中值滤波器的尺寸。
		 */
		public function get size():uint {
			return _size;
		}

		/**
		 * @param value 指定的中值滤波器尺寸。
		 */
		public function set size(value:uint):void {
			if (value == 3 || value == 5) {
				_size = value;
			} else {
				_size = 3;
			}
		}
	}
}