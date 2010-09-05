package aii.ui.graphics{
	import flash.display.Graphics;
	/**
	 * IGraphicFill定义用于进行填充的接口。
	 * @author Swfdong
	 */
	public interface IGraphicFill{
		/**
		 * 在Graphic对象内开始填充。
		 * @param target 指示用于进行填充的Graphics对象。
		 * @param width 边框的宽度。 
		 * @param height 边框的高度。 
		 */
		function beginFill(target:Graphics,width:Number,height:Number):void;
		/**
		 * 在Graphic对象内完成填充。
		 * @param target 指示用于完成填充的Graphics对象。
		 */
		function endFill(target:Graphics):void;
	}
}