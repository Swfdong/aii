package aii.ui.managers {	import aii.ui.core.UIComponent;	import aii.ui.styles.Style;	import aii.ui.styles.StyleSheet;	import aii.ui.styles.SilverBlueStyle;	import aii.utils.ClassUtil;	import aii.utils.ObjectUtil;	import aii.utils.StyleUtil;		import flash.utils.Dictionary;
	/**	 * StyleManager是静态工具类，用于管理组件的样式。	 * @author Swfdong	 */	public class StyleManager {		//样式表		protected static var defaultStyleSheet:StyleSheet = new SilverBlueStyle();		protected static const STYLES_DICT:Dictionary = new Dictionary(true);		/**		 * 获取当前组件的默认样式。		 * @param component		 * @return 一个样式对象。		 */		public static function getDefaultStyle(component:UIComponent):Style {			var type:Class = ClassUtil.getClass(component);			var sheet:Dictionary =defaultStyleSheet.sheet;			trace("==================================");			trace("【ComponentClass】:"+type);			if (STYLES_DICT[type] == undefined) {				var styleObject:Object=sheet[type];				var currentClass:Class=type;				do{					currentClass=ClassUtil.getSuperClass(currentClass);					styleObject=StyleUtil.merge(sheet[currentClass],styleObject,true);					trace("【CurrentClass】:"+currentClass);					ObjectUtil.traceObject(styleObject);					trace("==================================");				}while(currentClass!=UIComponent);				STYLES_DICT[type]=styleObject;			}			return (new Style(STYLES_DICT[type]));		}		/**		 * 获取当前组件的默认样式。		 * @param component		 * @return 一个样式对象。		 */		public static function getStyleObjectByKey(key:*):Object {			var styleObject:Object={};			var sheet:Dictionary=defaultStyleSheet.sheet;			if(sheet[key]!=undefined&&sheet[key]!=null){				styleObject=StyleUtil.mergeTo(styleObject,sheet[key]);			}			return (styleObject);		}		/**		 * 设定指定类型组件的全局样式。		 * @param type 组件类型。		 * @param style 指定的全局样式。		 */		public static function setGlobalStyle(type:Class,style:Object):void{			var data:Array=InstanceManager.getInstanceList(type);			var length:uint=data.length;			for(var i:int=0;i<length;i+=1){				data[i].refreshStyle();			}		}	}}