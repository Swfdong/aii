package aii.ui.graphics{
	import flash.display.Graphics;
	import flash.geom.Matrix;
	/**
	 * SolidFill类为Graphics对象指定单色填充。
	 * @author Swfdong
	 */
	public class GradientFill implements IGraphicFill{
		/**
		 * 渐变的类型。
		 * @default null
		 */
		public var type:String="linear";
		/**
		 * 渐变的颜色数组。
		 * @default null
		 */
		public var colors:Array=null;
		/**
		 * 渐变的透明度数组。
		 * @default null
		 */
		public var alphas:Array=null;
		/**
		 * 渐变的比率数组。
		 * @default null
		 */
		public var ratios:Array=null;
		/**
		 * 渐变的比率数组。
		 * @default null
		 */
		public var matrix:Matrix=null;
		/**
		 * 创建一个新的GardientFill实例。
		 * @param args 参数。
		 */
		public function GradientFill(args:Object){
		}
		public function beginFill(target:Graphics, width:Number, height:Number):void{
			target.beginGradientFill(type,colors,alphas,ratios,matrix);
		}
		public function endFill(target:Graphics):void{
			target.endFill();
		}
	}
}