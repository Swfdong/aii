package aii.utils{
	public class StyleUtil{
		/**
		 * 合并两个样式对象，并返回一个新的样式对象。
		 * @param x 用于合并的第一个样式对象。
		 * @param y 用于合并的第二个样式对象。
		 * @param inner 是否进行内部合并。
		 * @return 合并后的对象。
		 */
		public static function merge(x:Object, y:Object,inner:Boolean=false):Object {
			var result:Object = {};
			var currentProperty:String;
			for (currentProperty in x) {
				result[currentProperty] = x[currentProperty];
			}
			if(inner){
				for (currentProperty in y) {
					if (ClassUtil.getClass(y[currentProperty])!=Object) {
						result[currentProperty] = y[currentProperty];
					}else{
						result[currentProperty]=mergeTo(result[currentProperty],y[currentProperty]);
					}
				}
			}else{
				for (currentProperty in y) {
					result[currentProperty] = y[currentProperty];
				}
			}
			return result;
		}
		
		/**
		 * 合并两个对象的属性到第一个对象。
		 * @param x 用于合并的第一个对象。
		 * @param y 用于合并的第二个对象。
		 * @param inner 是否进行内部合并。
		 * @return 合并后的对象。
		 */
		public static function mergeTo(x:Object, y:Object,inner:Boolean=false):Object {
			if (x != null) {
				var currentProperty:String;
				//如果是动态对象
				if (ObjectUtil.isDynamic(x)) {
					for (currentProperty in y) {
						if (y[currentProperty]!=null) {
							if(inner&&ClassUtil.getClass(y[currentProperty])==Object){
								x[currentProperty]=mergeTo(x[currentProperty],y[currentProperty]);
							}else{
								x[currentProperty] = y[currentProperty];
							}
						}
					}
				} else {
					for (currentProperty in y) {
						if ((currentProperty in x)&&y[currentProperty]!=null) {
							if(inner&&ClassUtil.getClass(y[currentProperty])==Object){
								x[currentProperty]=mergeTo(x[currentProperty],y[currentProperty]);
							}else{
								x[currentProperty] = y[currentProperty];
							}
						}
					}
				}
			}else{
				x=y;
			}
			return x;
		}

	}
}