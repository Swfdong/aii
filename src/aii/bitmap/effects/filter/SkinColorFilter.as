package aii.bitmap.effects.filter {
	import aii.bitmap.effects.core.FilterEffect;
	import flash.display.BitmapData;

	/**
	 *  使用PixelBender实现的肤色过滤器，基于Soriano提出的颜色模型。
	 * @author Swfdong
	 */
	public class SkinColorFilter extends FilterEffect {
		[Embed('../../../../../data/SkinColorFilter.pbj', mimeType='application/octet-stream')]
		private static const DEFAULT_FILTER:Class;

		public function SkinColorFilter(data:BitmapData = null) {
			super(data);
		}

		override protected function setupFilter():void {
			setupFilterByClass(DEFAULT_FILTER);
		}
	}
}