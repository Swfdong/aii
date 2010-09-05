/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */
package aii.net.events {	import flash.events.Event;
	public class XNEvent extends Event {		public static const CONNECT_ERROR:String = "xn-connect-error";		public static const LOGIN_FAILURE:String = "xn-failure";		public static const LOGIN_SUCCESS:String = "xn-success";		public static const FEED:String = "xn-feed";		private var _data:*;
		public function XNEvent(type:String, d:XML = null):void {			_data = data;			super(type);		}
		public function get data():* {			return _data;		}
		public function set data(d:*):void {			_data = d;		}	}}