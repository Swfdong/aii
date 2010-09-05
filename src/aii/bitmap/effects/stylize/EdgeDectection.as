package aii.bitmap.effects.stylize {
	import aii.bitmap.effects.core.BitmapEffect;
	
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.filters.ConvolutionFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 边缘检测图像效果。
	 * @author Swfdong
	 */
	public class EdgeDectection extends BitmapEffect {
		protected static const FILTER_MAP:Array = [[[ -1, 0, 1, -2, 0, 2, -1, 0, 1 ], [ 1, 2, 1, 0, 0, 0, -1, -2, -1 ]], [[ -1, 0, 1, -1, 0, 1, -1, 0, 1 ], [ 1, 1, 1, 0, 0, 0, -1, -1, -1 ]]];
		public static const SOBEL:uint = 0;
		public static const HOUGH:uint = 1;
		public static const HORIZONTAL:uint = 2;
		public static const VERTICAL:uint = 4;
		private var _orientation:uint = 2;
		private var _type:uint = 1;

		/**
		 * 创建新的边缘检测效果对象。
		 * @param data 要使用的输入位图图像。
		 * @param type 指定的边缘检测算子类型。
		 * @param orientation 指定的边缘检测方向。
		 */
		public function EdgeDectection(data:BitmapData = null,type:uint = 0, orientation:uint = 2) {
			this.type = type;
			this.orientation = orientation;
			super(data);
		}

		override public function apply(data:BitmapData, rect:Rectangle = null, dest:Point = null):void {
			rect = (rect == null ? data.rect : rect);
			dest = (dest == null ? ZEROPOINT : dest);
			var filter:ConvolutionFilter;
			if (_orientation == 2 || _orientation == 4) {
				filter = new ConvolutionFilter(3, 3, FILTER_MAP[_type][(_orientation >> 1) - 1]);
				data.applyFilter(data, rect, dest, filter);
			} else {
				var clone:BitmapData = new BitmapData(data.width, data.height, data.transparent, 0x0);
				filter = new ConvolutionFilter(3, 3, FILTER_MAP[_type][0]);
				data.applyFilter(data, rect, dest, filter);
				clone.draw(data);
				filter = new ConvolutionFilter(3, 3, FILTER_MAP[_type][1]);
				data.applyFilter(data, rect, dest, filter);
				clone.draw(data, null, null, BlendMode.ADD);
				data.copyPixels(clone, rect, dest);
				clone.dispose();
			}
		}

		/**
		 * @return 当前边缘检测对象的算子类型。
		 */
		public function get type():uint {
			return _type;
		}

		/**
		 * @param value 指定的边缘检测算子类型。
		 */
		public function set type(value:uint):void {
			if (value == 1 || value == 2) {
				_type = value;
			} else {
				_type = 1;
			}
		}

		/**
		 * @return 当前边缘检测对象的方向类型。
		 */
		public function get orientation():uint {
			return _orientation;
		}

		/**
		 * @param value 指定的边缘检测方向类型。
		 */
		public function set orientation(value:uint):void {
			if (value == 2 || value == 4 || value == 6) {
				_orientation = value;
			} else {
				_orientation = 2;
			}
		}
	}
}