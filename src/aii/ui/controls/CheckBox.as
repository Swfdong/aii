/**

	public class CheckBox extends LabelButtonBase {
		//构造
		override protected function setWidthByLabel():void {
		//绘制按钮
		//绘制文本
			textField.x = _height;
			textField.y = ((_height - textField.height) >> 1)+1;