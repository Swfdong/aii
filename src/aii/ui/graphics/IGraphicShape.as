package aii.ui.graphics{
	import flash.display.Graphics;
	/**
	 * IGraphicShape定义用于绘制形状的接口。
	 * @author Swfdong
	 */
	public interface IGraphicShape{
		/**
		 * 在Graphic对象内开始绘制形状。
		 * @param target 指示用于进行绘制的Graphics对象。
		 * @param x 形状的横坐标。 
		 * @param y 形状的纵坐标。
		 * @param width 形状的宽度。 
		 * @param height 形状的高度。 
		 * @param radius 形状的圆角半径属性。实现有尖角的自定义形状时可选择性支持。
		 * @param sorption 形状的吸附属性，多用于符合组件的绘制。内置形状中仅RectangleShape支持吸附属性，在实现自定义形状时可选择性支持。
		 */
		function draw(target:Graphics,x:Number,y:Number,width:Number,height:Number,radius:Number=0,sorption:uint=0):void;
	}
}