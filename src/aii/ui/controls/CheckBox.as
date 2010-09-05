/** * @author Swfdong * Aii复选框组件 */package aii.ui.controls {	import aii.ui.controls.bases.LabelButtonBase;	import aii.ui.core.*;	import aii.ui.managers.GraphicManager;	import aii.ui.managers.TextManager;	import aii.ui.styles.Style;

	public class CheckBox extends LabelButtonBase {
		//构造		public function CheckBox(args:Object=null):void {			_height = 16;			super(args);		}
		override protected function setWidthByLabel():void {			_width = textField.width + _height;		}
		//绘制按钮		override protected function drawButtonGraphic():void {			ui.graphics.clear();			GraphicManager.drawBox(ui.graphics, _height, _height,_style,state);			if (_selected) {				var weight:uint=_style.getProperty("borderWeight",state);				var bw:uint = ((weight>= 0 ? weight : 0) << 2);				GraphicManager.drawRect(ui.graphics, bw, bw, _height - (bw << 1), _height - (bw << 1),_style.getProperty("borderColor",state),_style.getProperty("borderRadius",state)-(bw<<1));			}		}
		//绘制文本		override protected function drawTextLayout():void {			textField.width = _width -_height;
			textField.x = _height;
			textField.y = ((_height - textField.height) >> 1)+1;		}	}}