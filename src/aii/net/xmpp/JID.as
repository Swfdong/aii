/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */ //JIDpackage aii.net.xmpp {
	public class JID {		private var _jid:String;		private var _id:String;		private var _uid:String;
		public function JID(j:String) {			_jid = j;			var i:int = _jid.indexOf("/");			_id = _jid.slice(0, i);			i = _jid.lastIndexOf("@");			_uid = _jid.slice(0, i);		}
		public function get jid():String {			return _jid;		}
		public function get id():String {			return _id;		}
		public function get uid():String {			return _uid;		}
		public function get resource():String {			var i:int = _jid.indexOf("/");			if (i < 0) {				return null;			} else {				return _jid.slice(i + 1);			}		}	}}