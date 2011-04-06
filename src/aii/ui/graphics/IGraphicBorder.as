package aii.ui.graphics{
	import flash.display.Graphics;
	/**
	 * IGraphicBorder定义用于进行边框的接口。
	 * @author Swfdong
	 */
	public interface IGraphicBorder{
		/**
		 * 在Graphic对象内绘制边框。
		 * @param target 指示用于绘制边框的Graphics对象。 
		 * @param x 边框的横坐标。 
		 * @param y 边框的纵坐标。
		 * @param width 边框的宽度。 
		 * @param height 边框的高度。 
		 * @param shape 绘制的形状。
		 * @param sorption 形状的吸附属性，多用于符合组件的绘制。
		 */
		function draw(target:Graphics, x:Number, y:Number,width:Number, height:Number,shape:IGraphicShape,sorption:uint=0):void;
	}
}