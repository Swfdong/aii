package aii.ui.skins{
	import aii.ui.factory.TextFactory;
	
	import flash.text.TextField;
	
	public class ProgrammaticTextSkin extends ProgrammaticSkin{
		protected var _textField:TextField;
		public function ProgrammaticTextSkin(){
			createTextField();
		}
		protected function createTextField():void{
			_textField=TextFactory.createTextField();
		}
		/**
		 * 当前皮肤内文本框的引用。
		 */
		public function get textField():TextField{
			return _textField;
		}
	}
}