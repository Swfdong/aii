package aii.utils {
	import flash.utils.ByteArray;

	/**
	 * ObjectUtil类是静态工具类，包含了对Object对象的常用操作。
	 * @author Swfdong
	 */
	public class ObjectUtil {
		/**
		 * 创建对象拷贝（来自mx.utils.ObjectUtil类中的同名方法）
		 * @param value 要创建拷贝的对象。
		 * @return 拷贝对象。
		 */
		public static function clone(value:Object):Object {
			var buffer:ByteArray = new ByteArray();
			buffer.writeObject(value);
			buffer.position = 0;
			var result:Object = buffer.readObject();
			return result;
		}

		/**
		 * 合并两个对象，并返回一个新对象。
		 * @param x 用于合并的第一个对象。
		 * @param y 用于合并的第二个对象。
		 * @return 合并后的对象。
		 */
		public static function merge(x:Object, y:Object):Object {
			var result:Object = {};
			var currentProperty:String;
			for (currentProperty in x) {
				result[currentProperty] = x[currentProperty];
			}
			for (currentProperty in y) {
				result[currentProperty] = y[currentProperty];
			}
			return result;
		}

		/**
		 * 合并两个对象的属性到第一个对象。
		 * @param x 用于合并的第一个对象。
		 * @param y 用于合并的第二个对象。
		 * @return 合并后的对象。
		 */
		public static function mergeTo(x:Object, y:Object):Object {
			if (x != null) {
				var currentProperty:String;
				//如果是动态对象
				if (isDynamic(x)) {
					for (currentProperty in y) {
						if (y[currentProperty]!=null&&y[currentProperty]!=undefined) {
							x[currentProperty] = y[currentProperty];
						}
					}
				} else {
					for (currentProperty in y) {
						if ((currentProperty in x)&&y[currentProperty]!=null&&y[currentProperty]!=undefined) {
							x[currentProperty] = y[currentProperty];
						}
					}
				}
			}else{
				x=y;
			}
			return x;
		}

		/**
		 * 检查对象是否为动态对象。
		 */
		public static function isDynamic(value:Object):Boolean {
			try {
				value["TestIsDynamicTest"];
			} catch (e:Error) {
				return false;
			}
			return true;
		}
		/**
		 * 输出对象。
		 */
		public static function traceObject(value:Object):void{
			if(value!=null){
				var currentProperty:String;
				for (currentProperty in value) {
					if(isDynamic(value[currentProperty])){
						trace("[DYNAMIC OBJECT]"+currentProperty+" in "+value+":");
						traceObject(value[currentProperty]);
					}else{
						trace(currentProperty+" in "+value+":"+value[currentProperty]);
					}
				}
			}
		}
	}
}