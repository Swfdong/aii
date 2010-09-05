 /** * @author Swfdong * Aii标签组件 * 最轻量的组件，要自行创建继承自Aii UIComponent的组件请参考此类 */package aii.ui.controls {	import aii.ui.core.*;	import aii.ui.factory.TextFactory;	import aii.ui.managers.TextManager;		import flash.text.TextField;	import flash.text.TextFieldAutoSize;
	public class Label extends UIComponent {		protected var textField:TextField;		protected var _text:String;		protected var _size:uint = 0;		protected var _color:uint = 0;		protected var _autoSize:Boolean = false;		protected var _bold:Boolean = false;		protected var _align:String="left";
		//构造		public function Label(args:Object=null):void {			_width = 80;			_height = 18;			super(args);		}
		//配置		override protected function config():void {			textField = TextFactory.createTextField();			if (_text != null) {				textField.text = _text;			}			if (_color == 0) {				_color = _style.getProperty("fontColor",0);			}			if (_size == 0) {				_size = _style.fontSize;			}			addChild(textField);		}
		//重绘		override protected function draw():void {			if (invalidType & InvalidationType.TEXT) {				textField.text = _text;				if (_autoSize) {					textField.autoSize = TextFieldAutoSize.LEFT;					_width = textField.width;					_height = textField.height;				} else {					textField.autoSize = TextFieldAutoSize.NONE;					textField.width = _width;					textField.height = _height;				}			}			if (invalidType & InvalidationType.PROPERTY) {				TextManager.setSize(textField, _size);				TextManager.setColor(textField, _color);				TextManager.setBold(textField, _bold);				TextManager.setAlign(textField, _align);			}		}
		//文字内容		public function get text():String {			return _text;		}
		public function set text(value:String):void {			if (_text != value) {				_text = value;				invalidate(InvalidationType.TEXT);			}		}
		//自动尺寸		public function get autoSize():Boolean {			return _autoSize;		}
		public function set autoSize(value:Boolean):void {			if (_autoSize != value) {				_autoSize = value;				invalidate(InvalidationType.TEXT);			}		}
		//字号		public function get size():uint {			return _size;		}
		public function set size(value:uint):void {			if (_size != value) {				_size = value;				invalidate(InvalidationType.PROPERTY);			}		}
		//粗体		public function get bold():Boolean {			return _bold;		}
		public function set bold(value:Boolean):void {			if (_bold != value) {				_bold = value;				invalidate(InvalidationType.PROPERTY);			}		}
		//颜色		public function get color():uint {			return _color;		}
		public function set color(value:uint):void {			if (_color != value) {				_color = value;				invalidate(InvalidationType.PROPERTY);			}		}		//对齐		public function get align():String {			return _align;		}		public function set align(value:String):void {			if (_align != value) {				_align = value;				invalidate(InvalidationType.PROPERTY);			}		}	}}