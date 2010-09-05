package aii.ui.managers{
	import aii.ui.core.UIComponent;
	import aii.ui.skins.ISkin;
	import aii.ui.styles.Style;
	import aii.utils.ClassUtil;
	import aii.utils.ObjectUtil;
	
	import flash.utils.Dictionary;

	/**
	 * SkinManager是静态工具类，用于管理组件的皮肤。
	 * @author Swfdong
	 */
	public class SkinManager{
		protected static const SKINS_DICT:Dictionary = new Dictionary(true);
		/**
		 * 获取当前组件的默认样式。
		 * @param component
		 * @return 一个样式对象。
		 */
		public static function getDefaultSkin(component:UIComponent):ISkin {
			var type:Class = ClassUtil.getClass(component);
			if (SKINS_DICT[type] == undefined) {
				SKINS_DICT[type]=type.defaultSkin;
			}
			return new SKINS_DICT[type]();
		}
		/**
		 * 设定指定类型组件的全局皮肤。
		 * @param type 组件类型。
		 * @param skin 指定的全局皮肤。
		 */
		public static function setGlobalStyle(type:Class,skin:Class):void{
			var data:Array=InstanceManager.getInstanceList(type);
			var length:uint=data.length;
			for(var i:int=0;i<length;i+=1){
				data[i].refreshStyle();
			}
		}
	}
}