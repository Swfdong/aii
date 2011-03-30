/** * @author Swfdong * Aii复选框组件 */package aii.ui.controls {	import aii.ui.controls.bases.LabelButtonBase;	import aii.ui.core.*;	import aii.ui.graphics.BaseBorder;	import aii.ui.managers.GraphicManager;	import aii.ui.managers.TextManager;	import aii.ui.styles.Style;

	public class CheckBox extends LabelButtonBase {
		//构造		public function CheckBox(args:Object=null):void {			_height = 16;			super(args);		}
		override protected function setWidthByLabel():void {			_width = textField.width + _height;		}
		//绘制按钮		override protected function drawButtonGraphic():void {			ui.graphics.clear();			GraphicManager.drawBox(ui.graphics, _height, _height,_style,state);			if (_selected) {				var border:BaseBorder=_style.getStyle("border",state);				GraphicManager.drawBox(ui.graphics, _height - (border.leftWeight+border.rightWeight+6), _height - (border.topWeight+border.bottomWeight+6),_style,state,border.leftWeight+3,border.rightWeight+3,false);			}		}
		//绘制文本		override protected function drawTextLayout():void {			textField.width = _width -_height;
			textField.x = _height;
			textField.y = ((_height - textField.height) >> 1)+1;		}	}}