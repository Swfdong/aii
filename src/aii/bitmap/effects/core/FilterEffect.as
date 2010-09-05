package aii.bitmap.effects.core{
	import flash.display.BitmapData;
	import flash.display.Shader;
	import flash.filters.BitmapFilter;
	import flash.filters.ShaderFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 滤镜位图效果基类，创建基于滤镜的位图效果请继承自此类。
	 */
	public class FilterEffect extends BitmapEffect{
		protected var filter:BitmapFilter;
		public function FilterEffect(data:BitmapData=null):void{
			super(data);
		}
		override public function apply(data:BitmapData,rect:Rectangle=null,dest:Point=null):void{
			rect=(rect==null?data.rect:rect);
			dest=(dest==null?ZEROPOINT:dest);
			setupFilter();
			data.applyFilter(data,rect,dest,filter);
		}
		//设置滤镜
		protected function setupFilter():void{
		}
		//根据嵌入的PixBender文件来设置滤镜
		protected function setupFilterByClass(cls:Class):void{
			filter = new ShaderFilter(new Shader(new cls()));
		}
	}
}