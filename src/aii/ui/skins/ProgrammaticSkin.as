package aii.ui.skins {
	import aii.ui.managers.RenderManager;
	import aii.utils.ObjectUtil;
	
	import flash.display.Sprite;

	public class ProgrammaticSkin extends Sprite implements ISkin {
		protected var _state:uint = 0;
		protected var _x:int=0;
		protected var _y:int=0;
		protected var _width:int = 0;
		protected var _height:int = 0;
		
		protected var lock:Boolean = false;
		protected var invalidType:uint = 0;

		public function ProgrammaticSkin() {
		}

		/**
		 *设置皮肤样式。
		 * @param args 用于样式属性的对象。
		 */
		public function setStyles(args:Object):void {
			lock = true;
			ObjectUtil.mergeTo(this, args);
			lock = false;
			RenderManager.add(this);
		}

		public function resize(width:Number, height:Number):void {
			_width = width > 0 ? width >> 0 : _width;
			_height = height > 0 ? height >> 0 : _height;
			invalidate(InvalidationType.SIZE);
		}

		public function validate():void {
		}

		protected function invalidate(type:uint = 255):void {
			invalidType |= type;
			if (!lock) {
				RenderManager.add(this);
			}
		}

		public function get state():uint {
			return _state;
		}

		public function set state(value:uint):void {
			if (_state != value) {
				_state = value;
				invalidate(InvalidationType.STATE);
			}
		}
	}
}