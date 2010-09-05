/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */
package aii.net.xmpp {
	public class IQTemplate {		public static function RESOURCE(... args):XML {			return <bind xmlns='urn:ietf:params:xml:ns:xmpp-bind'><resource>{args[0]}</resource></bind>;		}
		public static function SESSION(... args):XML {			return <session xmlns='urn:ietf:params:xml:ns:xmpp-session'/>;		}
		public static function VCARD(... args):XML {			return <vCard xmlns='vcard-temp'/>;		}
		public static function QUERY_ROSTER(... args):XML {			return <query xmlns='jabber:iq:roster'/>;		}	}}