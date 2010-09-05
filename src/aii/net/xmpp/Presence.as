/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */
package aii.net.xmpp {
	public class Presence implements IXMPPStanza {		public static const SHOW:String = "show";		private var _xml:XML;
		public function Presence(from:String, initFunc:Function, ... args) {			_xml = initFunc(args);			_xml.@from = from;		}
		public function get xml():XML {			return _xml;		}
		public function get callBack():Function {			return null;		}
		public function get id():String {			return null;		}	}}