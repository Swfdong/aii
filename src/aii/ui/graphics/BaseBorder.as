package aii.ui.graphics{
	import aii.ui.managers.GraphicManager;
	import aii.utils.ObjectUtil;
	
	import flash.display.Graphics;
	
	public class BaseBorder{
		/**
		 * 色彩填充。
		 * @default null
		 */
		public var fill:IGraphicFill=null;
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
		/**
		 * 创建一个新的BaseBorder实例，大多数情况下，BaseBorder等于SolidBorder。
		 * @param args 边框的参数。
		 */
		public function BaseBorder(args:Object){
			ObjectUtil.mergeTo(this,args);
		}
		/**
		 * 在Graphic对象内绘制边框。
		 * @param target 指示用于绘制边框的Graphics对象。 
		 * @param width 边框的宽度。 
		 * @param height 边框的高度。 
		 * @param drawFill 背景填充。
		 * @param x 边框的横坐标。 
		 * @param y 边框的纵坐标。
		 */
		public function draw(target:Graphics, width:Number, height:Number,drawFill:IGraphicFill=null,x:Number=0, y:Number=0):void{
			if(drawFill!=null){
				//背景色彩
				drawFill.beginFill(target,width,height);
				GraphicManager.drawRoundRect(target,x+leftWeight, y+topWeight, width-rightWeight, height-bottomWeight, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
				drawFill.endFill(target);
			}
			if(leftWeight+topWeight+rightWeight+bottomWeight>0){
				//绘制边框
				fill.beginFill(target,width,height);
				GraphicManager.drawRoundRect(target,x, y, width, height, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
				if(drawFill!=null){
					GraphicManager.drawRoundRect(target,x+leftWeight, y+topWeight, width-leftWeight-rightWeight, height-topWeight-bottomWeight, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
				}
				fill.endFill(target);
			}
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