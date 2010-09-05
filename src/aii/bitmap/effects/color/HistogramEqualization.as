package aii.bitmap.effects.color{
	import aii.bitmap.effects.core.PaletteMapEffect;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	/**
	 * 直方图均衡化图像效果。
	 * @author Swfdong
	 */
	public class HistogramEqualization extends PaletteMapEffect{
		/**
		 * 创建新的直方图均衡化效果对象。
		 * @param data 需要处理的位图数据。
		 */
		public function HistogramEqualization(data:BitmapData=null){
			super(data);
		}
		override protected function getChannelOffsets(data:Vector.<Number>,offset:uint,totalPixels:Number):Array{
			var p:Vector.<Number>=new Vector.<Number>(256,true);
			var result:Array=new Array(256);
			var max:Number,min:Number,current:Number,range:Number;
			max=min=data[0]/totalPixels;
			//此处使用uint以保证数组索引访问的效率
			for(var i:uint=0;i<256;i+=1){
				current=data[i];
				if(current>0){
					if(max<i){
						max=i;
					}else if(min>i){
						min=i;
					}
				}
				p[i]=current/totalPixels;
			}
			range=max-min;
			var temp:Number;
			for(var j:uint=0;j<256;j+=1){
				temp=0;
				for(var k:uint=0;k<=j;k+=1){
					temp+=p[k];
				}
				result[j]=uint(((temp*range+min)>>0)<<offset);
			}
			return result;
		}
	}
}