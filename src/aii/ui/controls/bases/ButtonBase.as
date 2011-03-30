 /** * @author Swfdong * Aii基本按钮组件 */package aii.ui.controls.bases {	import aii.ui.core.*;	import aii.ui.managers.GraphicManager;	import flash.events.MouseEvent;	import flash.events.TimerEvent;	import flash.filters.GlowFilter;	import flash.filters.DropShadowFilter;	import flash.utils.Timer;	public class ButtonBase extends UIComponent {		//私有属性		protected var _pressRepeat:Boolean = false;		protected var _selected:Boolean = false;		protected var isDown:Boolean = false;		protected var pressTimer:Timer = new Timer(250);
		//构造		public function ButtonBase(args:Object=null):void {			_height = 16;			mouseChildren = false;			super(args);		}
		//配置		override protected function config():void {			if (_width==0) {				_width = _height;			}		}
		//配置侦听(基本按钮无焦点相应)		override protected function configEvents():void {			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler, false, 0, true);			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler, false, 0, true);			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler, false, 0, true);			addEventListener(MouseEvent.CLICK, mouseClickHandler, false, 0, true);			pressTimer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);		}
		override protected function removeEvents():void {			removeEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);			removeEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);			removeEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);			removeEventListener(MouseEvent.CLICK, mouseClickHandler);			pressTimer.removeEventListener(TimerEvent.TIMER, timerHandler);		}
		//TIMER响应;		protected function timerHandler(event:TimerEvent):void {			if (!_pressRepeat) {				endPress();				return;			} else if (pressTimer.delay > 50) {				pressTimer.delay -= 50;			}			handleClick();		}
		//鼠标响应		protected function mouseOverHandler(event:MouseEvent):void {			state = 1;			handleOver(event);			invalidate(InvalidationType.STATE);		}
		protected function mouseOutHandler(event:MouseEvent):void {			state = 0;			handleUp(event);			invalidate(InvalidationType.STATE);		}
		protected function mouseDownHandler(event:MouseEvent):void {			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler, false, 0, true);			if (_pressRepeat) {				pressTimer.start();			}			isDown = true;			state = 2;			handleDown(event);			invalidate(InvalidationType.STATE);		}
		protected function mouseUpHandler(event:MouseEvent):void {			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);			endPress();			isDown = false;			if (event.target == this) {				state = 1;				handleOver(event);			} else {				state = 0;				handleUpOutside(event);			}			invalidate(InvalidationType.STATE);		}
		protected function mouseClickHandler(event:MouseEvent):void {			handleClick();			invalidate(InvalidationType.STATE);		}
		//鼠标按下		protected function handleDown(event:MouseEvent):void {		}
		//鼠标经过		protected function handleOver(event:MouseEvent):void {		}
		//鼠标抬起		protected function handleUp(event:MouseEvent):void {		}
		//鼠标外部释放		protected function handleUpOutside(event:MouseEvent):void {		}
		//鼠标点击		protected function handleClick():void {			_selected = !_selected;			if (_defaultHandler != null) {				_defaultHandler();			}		}
		protected function endPress():void {			pressTimer.reset();			pressTimer.delay = 210;		}
		//可用性改变		override protected function enabledChange():void {			mouseEnabled = _enabled;		}
		//重绘		override protected function draw():void {			buttonMode = _enabled;			if (invalidType & InvalidationType.STATE) {				drawButtonGraphic();				ui.filters = _style.getStyle("filters",state);			}		}
		//绘制按钮		protected function drawButtonGraphic():void {			ui.graphics.clear();			GraphicManager.drawBox(ui.graphics, _width, _height,_style,state);		}
		//选中状态		public function get selected():Boolean {			return _selected;		}
		public function set selected(value:Boolean):void {			if (_selected != value) {				_selected = value;				invalidate(InvalidationType.STATE);			}		}
		//重复按下		public function get pressRepeat():Boolean {			return _pressRepeat;		}
		public function set pressRepeat(value:Boolean):void {			if (_pressRepeat != value) {				_pressRepeat = value;			}		}	}}