package aii.bitmap.effects.stylize {
	import aii.bitmap.effects.core.BitmapEffect;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 二值化图像效果。
	 * @author Swfdong
	 */
	public class Threshold extends BitmapEffect{
		private var _threshold:uint;

		/**
		 *创建新的二值化图像效果对象。
		 * @param data 需要处理的位图数据。
		 * @param threshold 二值化阈值。
		 */
		public function Threshold(data:BitmapData=null,threshold:uint = 128) {
			this.threshold = threshold;
			super(data);
		}

		override public function apply(data:BitmapData,rect:Rectangle=null,dest:Point=null):void{
			rect=(rect==null?data.rect:rect);
			dest=(dest==null?ZEROPOINT:dest);
			var hex:uint = (0xFF << 24) + (_threshold << 16) + (_threshold << 8) + _threshold;
			data.threshold(data, rect,dest, ">=", hex, 0xFFFFFFFF, 0xFFFFEEBB, false);
			data.threshold(data, rect,dest, "<", hex, 0, 0xFFFFEEBB, false);
		}

		/**
		 * @return 当前效果的二值化阈值。
		 */
		public function get threshold():uint {
			return _threshold;
		}

		/**
		 * @param value 指定的二值化阈值。
		 */
		public function set threshold(value:uint):void {
			_threshold = Math.min(254,Math.max(1,value));
		}
	}
}