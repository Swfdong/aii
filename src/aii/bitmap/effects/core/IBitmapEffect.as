package aii.bitmap.effects.core {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;

	/**
	 * 位图效果接口
	 * @author Swfdong
	 */
	public interface IBitmapEffect{
		function apply(data:BitmapData,rect:Rectangle=null,dest:Point=null):void;
	}
}