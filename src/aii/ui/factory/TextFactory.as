package aii.ui.factory{
	import aii.ui.managers.TextManager;
	
	import flash.text.TextField;
	public class TextFactory{
		public static function createTextField(type:String="dynamic",selectable:Boolean=false,multiline:Boolean=false):TextField{
			var textField:TextField = new TextField();
			textField.type = type;
			textField.defaultTextFormat = TextManager.defaultFormat;
			textField.selectable = textField.mouseEnabled = selectable;
			textField.multiline = multiline;
			textField.height=textField.defaultTextFormat.size+4;
			return textField;
		}
	}
}