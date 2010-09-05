/* license section

   Aii is free software: you can redistribute it and/or modify   it under the terms of the GNU General Public License as published by   the Free Software Foundation, either version 3 of the License, or   (at your option) any later version.   Aii is distributed in the hope that it will be useful,   but WITHOUT ANY WARRANTY; without even the implied warranty of   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the   GNU General Public License for more details.   You should have received a copy of the GNU General Public License   along with Aii.  If not, see <http://www.gnu.org/licenses/>.   © Swfdong 2010 */ //IQ数据类型package aii.net.xmpp {
	public class IQ implements IXMPPStanza {		public static const SET:String = "set";		public static const GET:String = "get";		public static const RESULT:String = "result";		public static const ERROR:String = "error";		private static var COUNT:uint = 0;		private var _id:String;		private var _xml:XML;		private var _callFunc:Function;
		//可选初始化模板		public function IQ(type:String, to:String, callFunc:Function, initFunc:Function, ... args) {			_callFunc = callFunc;			_id = uniqueID();			if (to == null || to == "") {				_xml = <iq type={type} id={_id}></iq>;			} else {				_xml = <iq type={type} id={_id} to={to}></iq>;			}			_xml.appendChild(initFunc(args));		}
		public function get xml():XML {			return _xml;		}
		public function get id():String {			return _id;		}
		public function get callBack():Function {			return _callFunc;		}
		public static function uniqueID():String {			COUNT++;			return "XIAORER-" + COUNT;		}	}}