package aii.utils{
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	/**
	 * ClassUtil类是静态工具类，包含了对Class对象的常用操作。
	 * @author Swfdong
	 */
	public class ClassUtil{
		/**
		 * 返回实例的类对象引用。 
		 * @param instance 
		 * @return 实例的类对象引用。 
		 */
		public static function getClass(instance:Object):Class{
			return (getDefinitionByName(getQualifiedClassName(instance)) as Class);
		}
		/**
		 * 返回实例的超类对象引用。 
		 * @param instance 
		 * @return 实例的超类对象引用。 
		 */
		public static function getSuperClass(instance:Object):Class{
			return (getDefinitionByName(getQualifiedSuperclassName(instance)) as Class);
		}
	}
}