package aii.bitmap {
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 基本位图处理。
	 * @author Swfdong
	 */
	public class BitmapEdge {
		protected static var ZEROPOINT:Point = new Point(0, 0);
		/**
		 * 扩展位图边缘。
		 * @param data 需要处理的位图数据。
		 * @param size 需要扩展的数量。
		 * @return 处理后的位图。
		 */
		public function expand(data:BitmapData, size:uint):BitmapData {
			var result:BitmapData = new BitmapData(data.width + (size << 1), data.height + (size << 1), data.transparent);
			result.copyPixels(data, data.rect, new Point(size, size));
			return result;
		}

		/**
		 * 缩小位图边缘。
		 * @param data 需要处理的位图数据。
		 * @param size 需要缩小的数量。
		 * @return 处理后的位图。
		 */
		public function inset(data:BitmapData, size:uint):BitmapData {
			var result:BitmapData = new BitmapData(data.width - (size << 1), data.height - (size << 1), data.transparent);
			result.copyPixels(data, new Rectangle(size, size, data.width - size, data.height - size), ZEROPOINT);
			return result;
		}
		/**
		 * 去除图像边缘空白区域。
		 * @param data 需要处理的位图数据。
		 * @param bgColor 背景颜色，默认为白色。
		 * @return 处理后的位图。
		 * @throws Error 处理后的位图为空。
		 */
		public function trim(data:BitmapData, bgColor:uint = 0xFFFFFF):BitmapData {
			//边界检测
			var width:uint = data.width;
			var height:uint = data.height;
			var nowRect:Rectangle = new Rectangle(0, 0, 1, 1);
			//使用getVector提升效率
			var trimRect:Rectangle = new Rectangle(0, 0, 1, height);
			var borderVector:Vector.<uint>;
			//横向
			leftLoop: for (var i:uint = 0; i < width; i += 1) {
				trimRect.x = i;
				borderVector = data.getVector(trimRect);
				for (var j:uint = 0; j < height; j += 1) {
					if (borderVector[j] != bgColor) {
						nowRect.left = i;
						break leftLoop;
					}
				}
			}
			rightLoop: for (var m:uint = width - 1; m >= 0; m -= 1) {
				trimRect.x = m;
				borderVector = data.getVector(trimRect);
				for (var n:uint = height - 1; n >= 0; n -= 1) {
					if (borderVector[n] != bgColor) {
						nowRect.right = m;
						break rightLoop;
					}
				}
			}
			//纵向
			trimRect.width = data.width;
			trimRect.height = 1;
			topLoop: for (var k:uint = 0; k < height; k += 1) {
				trimRect.y = k;
				borderVector = data.getVector(trimRect);
				for (var q:uint = 0; q < width; q += 1) {
					if (borderVector[q] != bgColor) {
						nowRect.top = k;
						break topLoop;
					}
				}
			}
			bottomLoop: for (var a:uint = height - 1; a >= 0; a -= 1) {
				trimRect.y = a;
				borderVector = data.getVector(trimRect);
				for (var b:uint = width - 1; b >= 0; b -= 1) {
					if (borderVector[b] != bgColor) {
						nowRect.bottom = a;
						break bottomLoop;
					}
				}
			}
			if (nowRect.width < 1 && nowRect.height < 1) {
				throw new Error("处理后位图为空！", 1001);
				return (null);
			}
			var result:BitmapData = new BitmapData(nowRect.width, nowRect.height, false);
			result.copyPixels(data, nowRect, ZEROPOINT);
			return result;
		}
	}
}