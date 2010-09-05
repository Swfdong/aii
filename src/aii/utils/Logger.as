/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */ //日志记录工具类package aii.utils {	import flash.utils.getTimer;	import flash.text.TextField;
	public class Logger {		private static var _logField:TextField;		private static var _time:Number;
		public static function init(target:TextField):void {			_logField = target;		}
		//普通信息		public static function log(i:String):void {			publish("信息", i);		}
		//警告		public static function warn(i:String):void {			publish("警告", i);		}
		//错误		public static function error(i:String):void {			publish("错误", i);		}
		//计时操作		public static function start():void {			_time = getTimer();		}
		//结束计时		public static function end(i:String):void {			publish("计时", "(耗时" + (getTimer() - _time) + "毫秒)" + i);		}
		private static function publish(t:String, i:String):void {			var d:Date = new Date();			i = "[" + t + " " + d.toTimeString().substr(0, 8) + "]" + i + "\n";			if (_logField != null) {				_logField.appendText(i);			} else {				trace(i);			}		}	}}