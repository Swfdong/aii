package aii.ui.managers{
	import aii.ui.core.UIComponent;
	import aii.ui.skins.ISkin;
	import aii.utils.ClassUtil;
	
	import flash.utils.Dictionary;

	/**
	 * InstanceManager是静态工具类，用于管理UI组件实例。
	 * @author Swfdong
	 */
	public class InstanceManager{
		protected static const INSTANCES_DICT:Dictionary = new Dictionary(true);
		/**
		 * 注册UI组件实例。
		 * @param component 待注册的组件实例。
		 */
		public static function registerInstance(component:UIComponent):void{
			var type:Class = ClassUtil.getClass(component);
			if (INSTANCES_DICT[type] == undefined) {
				INSTANCES_DICT[type] = new Array();
			}
			INSTANCES_DICT[type].push(component);
		}
		/**
		 * 获取某一类型组件的实例列表。
		 * @param type 组件的类型。
		 * @return 当前类型组件的实例列表。
		 */
		public static function getInstanceList(type:Class):Array{
			return INSTANCES_DICT[type];
		}
	}
}