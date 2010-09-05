package aii.ui.graphics{
	import flash.display.Graphics;

	/**
	 * IBorder定义用于组件边框的接口。
	 * @author Swfdong
	 */
	public interface IBorder{
		/**
		 * 在Graphic对象内绘制边框。
		 * @param target 指示用于绘制边框的Graphics对象。
		 * @param x 边框的横坐标。 
		 * @param y 边框的纵坐标。 
		 * @param width 边框的宽度。 
		 * @param height 边框的高度。 
		 */
		function draw(target:Graphics,x:Number,y:Number,width:Number,height:Number):void;
		function get weight():uint;
		function set weight(value:uint):void;
	}
}