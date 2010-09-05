package aii.ui.graphics.border{
	import aii.ui.graphics.IBorder;
	import aii.ui.managers.GraphicManager;
	
	import flash.display.Graphics;
	
	public class GraphicFillBorder implements IBorder{
		/**
		 * 顶部边框粗细。
		 * @default 1
		 */
		public var topWeight:uint = 1;
		/**
		 * 底部边框粗细。
		 * @default 1
		 */
		public  var bottomWeight:uint = 1;
		/**
		 * 左部边框粗细。
		 * @default 1
		 */
		public  var leftWeight:uint = 1;
		/**
		 * 右部边框粗细。
		 * @default 1
		 */
		public  var rightWeight:uint = 1;
		/**
		 * 左上角边角半径。
		 * @default 0
		 */
		public var topLeftRadius:Number = 0;
		/**
		 * 左下角边角半径。
		 * @default 0
		 */
		public var bottomLeftRadius:Number = 0;
		/**
		 * 右上角边角半径。
		 * @default 0
		 */
		public var topRightRadius:Number= 0;
		/**
		 * 右下角边角半径。
		 * @default 0
		 */
		public var bottomRightRadius:Number = 0;
		public function GraphicFillBorder()
		{
		}
		
		public function draw(target:Graphics, x:Number, y:Number, width:Number, height:Number):void{
			beginFill(target,width,height);
			GraphicManager.drawRoundRect(target,x, y, width, height, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
			GraphicManager.drawRoundRect(target,x+leftWeight, y+topWeight, width-rightWeight, height-bottomWeight, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
			target.endFill();
			
		}
		//子类覆盖此处即可修改边框着色方法
		protected function beginFill(target:Graphics,width:Number,height:Number):void{
		}
		/**
		 * 整体边框粗细，也可对四边的粗细进行单独设置。
		 * @default 1
		 */
		public function set weight(value:uint):void{
			topWeight = bottomWeight = leftWeight =rightWeight = value;
		}
		/**
		 * @private
		 */
		public function get weight():uint{
			return (topWeight + bottomWeight + leftWeight + rightWeight) >> 2;
		}
		/**
		 * 整体边角半径，也可对四个边角的半径进行单独设置。
		 * @default 0
		 */
		public function set radius(value:Number):void{
			topLeftRadius = bottomLeftRadius = topRightRadius = bottomRightRadius = value;
		}
		/**
		 * @private
		 */
		public function get radius():Number{
			return (topLeftRadius + bottomLeftRadius + topRightRadius + bottomRightRadius)/4;
		}
	}
}