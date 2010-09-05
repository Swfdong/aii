package aii.bitmap.effects.core{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * 色彩映射效果基类，创建基于色彩映射的位图效果请继承自此类。
	 * @author Swfdong
	 */
	public class PaletteMapEffect extends BitmapEffect{
		private var _automatic:Boolean=true;
		public function PaletteMapEffect(data:BitmapData=null){
			super(data);
		}
		override public function apply(data:BitmapData,rect:Rectangle=null,dest:Point=null):void{
			rect=(rect==null?data.rect:rect);
			dest=(dest==null?ZEROPOINT:dest);
			var histogram:Vector.<Vector.<Number>>=data.histogram(rect);
			var totalPixels:Number=rect.width*rect.height;
			var redOffsets:Array=getChannelOffsets(histogram[0],16,totalPixels);
			var greenOffsets:Array=getChannelOffsets(histogram[1],8,totalPixels);
			var blueOffsets:Array=getChannelOffsets(histogram[2],0,totalPixels);
			data.paletteMap(data,rect,dest,redOffsets,greenOffsets,blueOffsets);
		}
		//计算单个通道的色彩偏移，一般只需要override此方法即可。
		protected function getChannelOffsets(data:Vector.<Number>,offset:uint,totalPixels:Number):Array{
			return null;
		}
		/**
		 * @return 当前效果的自动调整设定。
		 */
		public function get automatic():Boolean{
			return _automatic;
		}
		/**
		 * @param value 指定当前效果是否对图像进行自动调整。
		 */
		public function set automatic(value:Boolean):void{
			_automatic = value;
		}
	}
}