package aii.ui.graphics.shape{
	import aii.ui.graphics.IGraphicShape;
	
	import flash.display.Graphics;
	/**
	 * EllipseShape类为Graphics对象指定椭圆形状。
	 * @author Swfdong
	 */
	public class EllipseShape implements IGraphicShape{
		public function draw(target:Graphics, x:Number, y:Number, width:Number, height:Number, radius:Number=0, sorption:uint=0):void{
			target.drawEllipse(x,y,width,height);
		}
	}
}