/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */
package aii.ui.managers {	import flash.text.TextField;	import flash.text.TextFormat;	import flash.system.Capabilities;
	public class TextManager {		//获取默认字体设置		public static function get defaultSize():uint {			return 12;		}
		public static function get defaultFormat():TextFormat {			var format:TextFormat = new TextFormat();			format.size = defaultSize;			//XP/2K			if (Capabilities.os == "Windows XP" || Capabilities.os == "Windows 2000") {				format.font = "宋体";					//Vista/Win7			} else if (Capabilities.os.indexOf("Windows") != -1) {				format.font = "微软雅黑";					//Mac			} else if (Capabilities.os.indexOf("Mac") != -1) {				format.font = "STXihei";					//Linux?			} else {				format.font = "黑体";			}			return format;		}
		//修改字号		public static function setSize(target:TextField, size:uint):void {			var format:TextFormat = target.getTextFormat();			format.size = size;			target.setTextFormat(format);			target.defaultTextFormat = format;		}
		//修改字色		public static function setColor(target:TextField, color:uint):void {			var format:TextFormat = target.getTextFormat();			format.color = color;			target.setTextFormat(format);			target.defaultTextFormat = format;		}
		//修改粗体		public static function setBold(target:TextField, bold:Boolean):void {			var format:TextFormat = target.getTextFormat();			format.bold = bold;			target.setTextFormat(format);			target.defaultTextFormat = format;		}
		//修改对齐
		public static function setAlign(target:TextField, align:String):void {
			var format:TextFormat = target.getTextFormat();
			format.align = align;
			target.setTextFormat(format);
			target.defaultTextFormat = format;
		}	}}