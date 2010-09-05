/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */
package aii.net.events {	import flash.events.Event;
	public class RosterEvent extends Event {		private var _data:*;		public static const INIT:String = "roster-init";		public static const ONLINE_CHANGE:String = "roster-online-change";		public static const ONLINE_INIT:String = "roster-online-init";		public static const SELF_VCARD:String = "roster-self-vcard";		public static const FRIEND_VCARD:String = "roster-friend-vcard";
		public function RosterEvent(type:String, d:XML = null):void {			_data = d;			super(type);		}
		public function get data():* {			return _data;		}
		public function set data(d:*):void {			_data = d;		}	}}