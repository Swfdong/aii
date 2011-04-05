package aii.ui.graphics.shape{
	import aii.ui.graphics.IGraphicShape;
	
	import flash.display.Graphics;
	
	/**
	 * TickShape类为Graphics对象指定对勾形状。
	 * @author Swfdong
	 */
	public class TickShape implements IGraphicShape{
		public function draw(target:Graphics, x:Number, y:Number, width:Number, height:Number, radius:Number=0, sorb:uint=0):void{
			var lw:Number=width/6;
			var lh:Number=height/5;
			target.moveTo(x+width-lw,y);
			target.lineTo(x+width,y+lh);
			target.lineTo(x+width*0.38,y+height);
			target.lineTo(x,y+height*0.5);
			target.lineTo(x+lw,y+height*0.5-lh);
			target.lineTo(x+width*0.38,y+height-lh-lw);
			target.lineTo(x+width-lw,y);
		}
	}
}