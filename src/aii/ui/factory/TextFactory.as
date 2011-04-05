package aii.ui.factory{
	import aii.ui.managers.TextManager;
	
	import flash.text.TextField;
	/**
	 * TextFactory提供了用于创建文本的静态方法。
	 * @author Swfdong
	 */
	public class TextFactory{
		/**
		 * 创建一个TextField文本框。
		 * @param type 文本框类型。
		 * @param selectable 指定文本框是否可选。
		 * @param multiline 文本框的多行属性。
		 * @return 创建完成的文本框。
		 */
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