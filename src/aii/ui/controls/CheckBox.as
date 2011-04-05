package aii.ui.controls {	import aii.ui.controls.bases.LabelButtonBase;	import aii.ui.core.*;	import aii.ui.factory.GraphicFactory;	import aii.ui.graphics.border.SolidBorder;

	/**	 * CheckBox类提供了选框组件，选框组件为单个布朗值变量实现了直观的修改方式。	 * @author Swfdong	 */	public class CheckBox extends LabelButtonBase {		/**		 * 创建一个新的选框组件实例。		 * @param args		 */		public function CheckBox(args:Object=null):void {			_height = 16;			super(args);		}
		override protected function setWidthByLabel():void {			_width = textField.width + _height;		}
		//绘制按钮		override protected function drawButtonGraphic():void {			ui.graphics.clear();			GraphicFactory.drawUIShape(ui.graphics,GraphicFactory.RECTANGLE,_height, _height,_style,state);			if (_selected) {				var border:SolidBorder=_style.getStyle("border",state);				GraphicFactory.drawShape(ui.graphics,GraphicFactory.TICK,1,2,_height-2,_height-4,border.fill);			}		}
		//绘制文本		override protected function drawTextLayout():void {			textField.width = _width -_height;
			textField.x = _height;
			textField.y = ((_height - textField.height) >> 1)+1;		}	}}