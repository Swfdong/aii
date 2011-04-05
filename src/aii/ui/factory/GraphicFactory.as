package aii.ui.factory {	import aii.ui.graphics.*;	import aii.ui.graphics.border.*;	import aii.ui.graphics.shape.*;	import aii.ui.styles.Style;		import flash.display.Graphics;	/**	 * GraphicFactory类提供了用于二维绘图的静态方法。	 * @author Swfdong	 */	public class GraphicFactory {		/**		 * 矩形形状。		 * @default 		 */		public static const RECTANGLE:RectangleShape=new RectangleShape();		/**		 * 椭圆形状。		 * @default 		 */		public static const ELLIPSE:EllipseShape=new EllipseShape();		/**		 * 对勾形状。		 * @default 		 */		public static const TICK:TickShape=new TickShape();		/**		 * 绘制组件整体外观用的形状。		 * @param target 指示用于进行绘制的Graphics对象。		 * @param shape 进行绘制的形状。		  * @param width 矩形的宽度。 		 * @param height 矩形的高度。		 * @param style 用于绘制的样式对象。		 * @param state 用于绘制的样式状态。		 * @param sorb 矩形的吸附状态。		 */		public static function drawUIShape(target:Graphics,shape:IGraphicShape,width:Number,height:Number, style:Style, state:uint = 0,sorb:uint=0):void {			var fill:IGraphicFill=style.getStyle("fill",state);			var border:SolidBorder=style.getStyle("border",state);			fill.beginFill(target,width,height);			shape.draw(target,0, 0, width, height,border.radius);			fill.endFill(target);			border.draw(target,0,0,width,height,shape,sorb);		}		/**		 * @param target 指示用于进行绘制的Graphics对象。		 * @param shape 进行绘制的形状。		 * @param x 形状的横坐标。 		 * @param y 形状的纵坐标。		 * @param width 形状的宽度。 		 * @param height 形状的高度。		 * @param fill 形状的填充。		 */		public static function drawShape(target:Graphics,shape:IGraphicShape,x:Number,y:Number,width:Number,height:Number,fill:IGraphicFill):void {			fill.beginFill(target,width,height);			shape.draw(target,x, y, width, height);			fill.endFill(target);		}	}}