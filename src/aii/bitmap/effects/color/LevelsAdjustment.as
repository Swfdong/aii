package aii.bitmap.effects.color {
	import aii.bitmap.effects.core.PaletteMapEffect;
	
	import flash.display.BitmapData;

	public class LevelsAdjustment extends PaletteMapEffect {
		protected var _max:uint = 0xFFFFFF;
		protected var _min:uint = 0x000000;

		public function LevelsAdjustment(data:BitmapData = null) {
			super(data);
		}

		override protected function getChannelOffsets(data:Vector.<Number>, offset:uint, totalPixels:Number):Array {
			var max:uint, min:uint, differ:Number;
			//计算最大值，最小值，范围
			if (automatic) {
				//最小值
				for (var i:uint = 0; i < 256; i += 1) {
					if (data[i] != 0) {
						min = i;
						break;
					}
				}
				//最大值
				for (var j:uint = 255; j >= 0; j -= 1) {
					if (data[j] != 0) {
						max = j;
						break;
					}
				}
				differ = max - min;
				min += differ * 0.055;
				max -= differ * 0.055;
			}else{
				max=(_max&(0xFF<<offset))>>offset;
				min=(_min&(0xFF<<offset))>>offset;
			}
			differ = max - min;
			var result:Array=new Array(256);
			var q:Number=255/differ;
			for(var k:uint=0;k<256;k+=1){
				if(k<=min){
					result[k]=(0x0)<<offset;
				}else if(k>=max){
					result[k]=(0xFF)<<offset;
				}else{
					result[k]=((k-min)*q)<<offset;
				}
			}
			return result;
		}
	}
}