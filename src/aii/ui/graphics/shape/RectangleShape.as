package aii.ui.graphics.shape{
	import aii.ui.core.SorptionType;
	import aii.ui.graphics.IGraphicShape;
	
	import flash.display.Graphics;
	
	/**
	 * RectangleShape类为Graphics对象指定矩形形状。
	 * @author Swfdong
	 */
	public class RectangleShape implements IGraphicShape{
		public function draw(target:Graphics, x:Number, y:Number, width:Number, height:Number,radius:Number=0, sorption:uint=0):void{
			var topLeftRadius:Number, topRightRadius:Number, bottomLeftRadius:Number, bottomRightRadius:Number;
			topLeftRadius=topRightRadius=bottomLeftRadius=bottomRightRadius=radius;
			//如果需要绘制吸附边缘
			if(sorption!=0){
				if(sorption&SorptionType.TOP){
					topLeftRadius=topRightRadius=0;
				}
				if(sorption&SorptionType.LEFT){
					topLeftRadius=bottomLeftRadius=0;
				}
				if(sorption&SorptionType.BOTTOM){
					bottomLeftRadius=bottomRightRadius=0;
				}
				if(sorption&SorptionType.RIGHT){
					topRightRadius=bottomRightRadius=0;
				}
			}
			drawRoundRect(target, x, y, width, height, topLeftRadius, topRightRadius, bottomLeftRadius, bottomRightRadius);
		}
		/**
		 * 绘制圆角矩形（来自mx.utils.GraphicUtil类中的drawRoundRectComplex方法）。
		 * @param target 指示用于绘制圆角矩形的Graphic对象。
		 * @param x 圆角矩形的横坐标。
		 * @param y 圆角矩形的纵坐标。
		 * @param width 圆角矩形的宽度。
		 * @param height 圆角矩形的高度。
		 * @param topLeftRadius 左上角半径。
		 * @param topRightRadius 右上角半径。
		 * @param bottomLeftRadius 左下角半径。
		 * @param bottomRightRadius 右下角半径。
		 */
		protected static function drawRoundRect(target:Graphics, x:Number, y:Number, width:Number, height:Number, topLeftRadius:Number, topRightRadius:Number, bottomLeftRadius:Number, bottomRightRadius:Number):void {
			var xw:Number = x + width;
			var yh:Number = y + height;
			// Make sure none of the radius values are greater than w/h.
			// These are all inlined to avoid function calling overhead
			var minSize:Number = width < height ? width / 2 : height / 2;
			topLeftRadius = topLeftRadius < minSize ? topLeftRadius : minSize;
			topRightRadius = topRightRadius < minSize ? topRightRadius : minSize;
			bottomLeftRadius = bottomLeftRadius < minSize ? bottomLeftRadius : minSize;
			bottomRightRadius = bottomRightRadius < minSize ? bottomRightRadius : minSize;
			var a:Number = bottomRightRadius * 0.292893218813453; // radius - anchor pt;
			var s:Number = bottomRightRadius * 0.585786437626905; // radius - control pt;
			target.moveTo(xw, yh - bottomRightRadius);
			target.curveTo(xw, yh - s, xw - a, yh - a);
			target.curveTo(xw - s, yh, xw - bottomRightRadius, yh);
			// bottom-left corner
			a = bottomLeftRadius * 0.292893218813453;
			s = bottomLeftRadius * 0.585786437626905;
			target.lineTo(x + bottomLeftRadius, yh);
			target.curveTo(x + s, yh, x + a, yh - a);
			target.curveTo(x, yh - s, x, yh - bottomLeftRadius);
			// top-left corner
			a = topLeftRadius * 0.292893218813453;
			s = topLeftRadius * 0.585786437626905;
			target.lineTo(x, y + topLeftRadius);
			target.curveTo(x, y + s, x + a, y + a);
			target.curveTo(x + s, y, x + topLeftRadius, y);
			// top-right corner
			a = topRightRadius * 0.292893218813453;
			s = topRightRadius * 0.585786437626905;
			target.lineTo(xw - topRightRadius, y);
			//if(topRightRadius>0){
			target.curveTo(xw - s, y, xw - a, y + a);
			target.curveTo(xw, y + s, xw, y + topRightRadius);
			//}
			target.lineTo(xw, yh - bottomRightRadius);
		}
	}
}