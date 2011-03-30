package aii.ui.controls.bases{
	import aii.ui.core.*;
	import aii.ui.factory.TextFactory;
	import aii.ui.managers.GraphicManager;
	import aii.ui.managers.TextManager;
	import aii.ui.styles.*;
	
	import flash.events.FocusEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.system.IME;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	public class TextBase extends UIComponent{
		//记录输入法状态
		protected static var pime:Boolean = false;
		//属性
		protected var _text:String;
		protected var _restrict:String;
		protected var _defaultText:String;
		protected var _ime:Boolean = true;
		protected var _autoSelect:Boolean = false;
		protected var _password:Boolean = false;
		protected var textField:TextField;
		public function TextBase(args:Object=null){
			super(args);
		}
		//配置
		override protected function config():void {
			createTextField();
			textField.height = _height-8;
			_defaultText = (_defaultText == null ? "" : _defaultText);
			textField.text = _defaultText;
			addChild(textField);
		}
		protected function createTextField():void{
			textField=TextFactory.createTextField(TextFieldType.INPUT,true);
		}
		//焦点侦听
		override protected function configEvents():void {
			textField.addEventListener(FocusEvent.FOCUS_IN, focusEventHandler, false, 0, true);
			textField.addEventListener(FocusEvent.FOCUS_OUT, focusEventHandler, false, 0, true);
			state = 0;
		}
		override protected function removeEvents():void {
			textField.removeEventListener(FocusEvent.FOCUS_IN, focusEventHandler);
			textField.removeEventListener(FocusEvent.FOCUS_OUT, focusEventHandler);
			state = 3;
		}
		protected function focusEventHandler(event:FocusEvent):void {
			if (event.type == FocusEvent.FOCUS_IN) {
				state = 2;
				pime = IME.enabled;
				IME.enabled = _ime && (!_password);
			} else if (event.type == FocusEvent.FOCUS_OUT) {
				state = 0;
				IME.enabled = pime;
			}
			invalidate(InvalidationType.STATE);
		}
		//重绘
		override protected function draw():void {
			if (invalidType & InvalidationType.PROPERTY) {
				textField.selectable = _enabled;
			}
			if (invalidType & InvalidationType.STATE) {
				ui.graphics.clear();
				GraphicManager.drawBox(ui.graphics, _width, _height, _style,state);
				ui.filters = _style.getStyle("filters",state);
				TextManager.setSize(textField, _style.getStyle("fontSize",state));
				TextManager.setColor(textField, _style.getStyle("fontColor",state));
				if (state == 0 && (textField.text == "" || textField.text == _defaultText)) {
					textField.text = _defaultText;
					textField.displayAsPassword = false;
				} else if (state == 2) {
					if (textField.text == _defaultText) {
						textField.text = "";
						textField.displayAsPassword = _password;
					} else if (_autoSelect) {
						textField.setSelection(0, textField.length);
					}
				}
			}
			if (invalidType & InvalidationType.SIZE) {
				textField.width = _width - 8;
				textField.x = ((_width - textField.width) >> 1);
				textField.y = ((_height - textField.height) >> 1) + 1;
			}
		}
		//可用性改变
		override protected function enabledChange():void {
			if (!_enabled) {
				textField.type = TextFieldType.DYNAMIC;
			} else {
				textField.type = TextFieldType.INPUT;
			}
		}
		//文字内容
		public function get text():String {
			return textField.text;
		}
		public function set text(value:String):void {
			if (_text != value) {
				_text = value;
				invalidate();
			}
		}
		//默认文本
		public function get defaultText():String {
			return _defaultText;
		}
		public function set defaultText(value:String):void {
			if (_defaultText != value) {
				if (textField != null && textField.text == _defaultText) {
					textField.text = "";
				}
				_defaultText = value;
				invalidate(InvalidationType.STATE);
			}
		}
		//最大字数
		public function get autoSelect():Boolean {
			return _autoSelect;
		}
		public function set autoSelect(value:Boolean):void {
			if (_autoSelect != value) {
				_autoSelect = value;
				invalidate(InvalidationType.PROPERTY);
			}
		}
		//接受的字符
		public function get restrict():String {
			return _restrict;
		}
		public function set restrict(value:String):void {
			if (_restrict != value) {
				_restrict = value;
				invalidate(InvalidationType.PROPERTY);
			}
		}
		//使用输入法
		public function get ime():Boolean {
			return _ime;
		}
		public function set ime(value:Boolean):void {
			if (_ime != value) {
				_ime = value;
			}
		}
		//使用密码
		public function get password():Boolean {
			return _password;
		}
		public function set password(value:Boolean):void {
			if (_password != value) {
				_password = value;
				invalidate(InvalidationType.PROPERTY);
			}
		}
	}
}