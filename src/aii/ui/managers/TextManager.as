/* license section

   Aii is free software: you can redistribute it and/or modify
package aii.ui.managers {
	public class TextManager {
		public static function get defaultFormat():TextFormat {
		//修改字号
		//修改字色
		//修改粗体
		//修改对齐
		public static function setAlign(target:TextField, align:String):void {
			var format:TextFormat = target.getTextFormat();
			format.align = align;
			target.setTextFormat(format);
			target.defaultTextFormat = format;
		}