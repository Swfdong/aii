/** * @author Swfdong * Aii按钮组件*/package aii.ui.controls{	import aii.ui.controls.bases.LabelButtonBase;	import aii.ui.core.*;	import aii.ui.managers.TextManager;
	public class Button extends LabelButtonBase {		//覆盖父类属性		//私有属性		protected var _toggle:Boolean=false;		//构造		public function Button(args:Object=null):void {			_height=26;			super(args);		}		override protected function config():void{			super.config();			TextManager.setAlign(textField,"center");		}		override protected function handleClick():void {			if (_toggle) {				_selected=! _selected;			}			if (_defaultHandler!=null) {				_defaultHandler();			}		}		//重绘		override protected function draw():void {			buttonMode=_enabled;			if (invalidType&InvalidationType.STATE) {				if (! _enabled) {					state=3;				} else if (_toggle&&_selected) {					state=2;				}				drawButtonGraphic();				ui.filters = _style.getProperty("filters",state);				TextManager.setSize(textField, _style.getProperty("fontSize",state));				TextManager.setColor(textField, _style.getProperty("fontColor",state));			}			if (invalidType&InvalidationType.SIZE||invalidType&InvalidationType.TEXT) {				textField.text=_label;				drawTextLayout();			}		}		//是否可选		public function get toggle():Boolean {			return _toggle;		}		public function set toggle(value:Boolean):void {			if (_toggle!=value) {				_toggle=value;				invalidate(InvalidationType.STATE);			}		}	}}