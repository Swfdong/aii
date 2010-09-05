package aii.bitmap.effects.color{
	import aii.bitmap.BitmapTransform;
	import aii.bitmap.effects.core.BitmapEffect;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	/**
	 * 白平衡调整图像效果。
	 * @author Swfdong
	 */
	public class WhiteBalance extends BitmapEffect{
		protected var transformer:BitmapTransform;
		/**
		 * 创建新的白平衡调整效果对象。
		 * @param data 需要处理的位图数据。
		 */
		public function WhiteBalance(data:BitmapData=null){
			transformer=new BitmapTransform();
			super(data);
		}
		override public function apply (data:BitmapData,rect:Rectangle=null,dest:Point=null):void{
			rect=(rect==null?data.rect:rect);
			dest=(dest==null?ZEROPOINT:dest);
			var totalPixels:Number=rect.width*rect.height;
			var samples:BitmapData=transformer.resize(data,1,1);
			var samplesColor:uint=samples.getPixel(0,0);
			var grayColor:uint=(samplesColor>>16)*0.299+((samplesColor&0x00FF00)>>8)*0.587+(samplesColor&0xFF)*0.114;
			var redOffset:int=grayColor-(samplesColor>>16);
			var greenOffset:int=grayColor-((samplesColor&0x00FF00)>>8);
			var blueOffset:int=grayColor-(samplesColor&0xFF);
			trace(redOffset,greenOffset,blueOffset,(samplesColor>>16),((samplesColor&0x00FF00)>>8),(samplesColor&0xFF));
			var redOffsets:Array=getChannelOffsets( redOffset,16);
			var greenOffsets:Array=getChannelOffsets( greenOffset,8);
			var blueOffsets:Array=getChannelOffsets(blueOffset,0);
			data.paletteMap(data,rect,dest,redOffsets,greenOffsets,blueOffsets);
		}
		protected function getChannelOffsets(channelOffset:int,offset:uint):Array{
			var result:Array=new Array(256);
			for(var i:uint=0;i<256;i+=1){
				if(i+channelOffset<=0){
					result[i]=0<<offset;
				}else if(i+channelOffset>=255){
					result[i]=255<<offset;
				}else{
					result[i]=(i+channelOffset)<<offset;
				}
			}
			return result;
		}
	}
}