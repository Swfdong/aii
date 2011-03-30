package aii.ui.graphics{
	import aii.utils.ObjectUtil;
	
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
		 * 渐变的旋转角度。
		 * @default null
		 */
		public var rotation:Number=90;
		/**
		 * 渐变的横向缩放。
		 * @default 1
		 */
		public var scaleX:Number=1;
		/**
		 * 渐变的纵向缩放。
		 * @default 1
		 */
		public var scaleY:Number=1;
		/**
		 * 渐变的横向偏移。
		 * @default 1
		 */
		public var tx:Number=0;
		/**
		 * 渐变的纵向偏移。
		 * @default 1
		 */
		public var ty:Number=0;
		/**
		 * 创建一个新的GardientFill实例。
		 * @param args 渐变填充的参数。
		 */
		public function GradientFill(args:Object){
			ObjectUtil.mergeTo(this,args);
		}
		public function beginFill(target:Graphics, width:Number, height:Number):void{
			var matrix:Matrix=new Matrix();
			matrix.createGradientBox(width*scaleX,height*scaleY,Math.PI*rotation/180,tx,ty);
			target.beginGradientFill(type,colors,alphas,ratios,matrix);
		}
		public function endFill(target:Graphics):void{
			target.endFill();
		}
	}
}