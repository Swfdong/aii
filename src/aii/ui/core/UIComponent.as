package aii.ui.core {	import aii.ui.managers.InstanceManager;	import aii.ui.managers.RenderManager;	import aii.ui.managers.StyleManager;	import aii.ui.styles.*;	import aii.utils.ObjectUtil;		import flash.display.DisplayObject;	import flash.display.DisplayObjectContainer;	import flash.display.Loader;	import flash.display.Sprite;	import flash.events.Event;	import flash.utils.getDefinitionByName;	import flash.utils.getQualifiedClassName;

	/**	 * Aii组件基类，提供了组件常用的基本方法。	 * @author Swfdong	 */	public class UIComponent extends Sprite  implements IRenderClient{		//私有属性		private var _initialized:Boolean = false;		//子类可访问的属性部分		protected var _styleObject:Object={};		protected var _parent:DisplayObjectContainer;		protected var _width:Number=0;		protected var _height:Number=0;		protected var _enabled:Boolean = true;		protected var _tip:String; //提示		protected var _defaultHandler:Function;		protected var _style:Style;		protected var ui:Sprite;		protected var state:uint=0;		protected var invalidType:uint = 255; //重绘类型		/**		 * 创建一个新的UIComponent类实例。		 * 但由于UIComponent类并无实际功能，请不要直接进行实例化。		 * @param args 组件的初始化参数。		 */		public function UIComponent(args:Object):void {			initialize(args);		}		////////////////////////////////////////////////////////////		//                    初始化相关方法		////////////////////////////////////////////////////////////		/**		 * 对组件进行初始化。		 * @param args 组件的初始化参数。		 */		protected function initialize(args:Object):void {			if(!_initialized){				createChildren();				_style = StyleManager.getDefaultStyle(this); //获取样式				setProperties(args);				initializeCommon();				_initialized=true;			}		}		/**		 *创建组件子对象。		 */		protected function createChildren():void {			ui = new Sprite();			addChild(ui);		}		/**		 * 初始化组件一般杂项。		 */		private function initializeCommon():void {			focusRect = false;			if(_parent!=null){				addTo(_parent);			}			config();			configEvents();		}		/**		 * 配置组件杂项。		 */		protected function config():void {		}		/**		 * 配置组件事件侦听。		 */		protected function configEvents():void {		}		/**		 * 移除组件事件侦听。		 */		protected function removeEvents():void {		}		//属性批量赋值		/**		 * @param args		 */		public function setProperties(args:Object):void {			ObjectUtil.mergeTo(this, args);		}		////////////////////////////////////////////////////////////		//                        公有方法		////////////////////////////////////////////////////////////		//添加至容器		/**		 * @param container		 * @return 		 */		public function addTo(container:DisplayObjectContainer):Boolean {			if(!(container is Loader)){				container.addChild(this);				return true;			} 			return false;		}		//从容器中移除		/**		 */		public function removeFormParent():void {			//parent.removeChild(_ui);		}		//移动		/**		 * @param xvalue		 * @param yvalue		 */		public function move(xvalue:int, yvalue:int):void {			x = xvalue;			y = yvalue;		}		/**		 * @param wvalue		 * @param hvalue		 */		public function resize(wvalue:Number, hvalue:Number):void {			_width = wvalue > 1 ? wvalue >> 0 : _width;			_height = hvalue > 1 ? hvalue >> 0 : _height;			invalidate(InvalidationType.SIZE);		}		/**		 */		public function refreshStyle():void{					}		/**		 * 对组件的渲染进行验证。		 */		public function validate():void {			draw();			invalidType=0;		}		protected function invalidate(type:uint=255):void {			invalidType |= type;			RenderManager.add(this);		}		////////////////////////////////////////////////////////////		//                        私有方法		////////////////////////////////////////////////////////////		protected function draw():void {		}		protected function enabledChange():void {		}		////////////////////////////////////////////////////////////		//                     Getter&Setter		////////////////////////////////////////////////////////////		//可用性		/**		 * @param value		 */		public function set enabled(value:Boolean):void {			if (_enabled != value) {				_enabled = value;				if (_enabled) {					state = 0;					configEvents();				} else {					state = 3;					removeEvents();				}				enabledChange();				invalidate(InvalidationType.STATE);			}		}		/**		 * @return 		 */		public function get enabled():Boolean {			return _enabled;		}		//默认处理		/**		 * @param value		 */		public function set defaultHandler(value:Function):void {			_defaultHandler = value;		}		/**		 * @return 		 */		public function get defaultHandler():Function {			return _defaultHandler;		}		//样式		/**		 * @param value		 */		public function set style(value:Object):void {			_styleObject=value;			_style=new Style(_styleObject);			_style.setStyles(_styleObject);			invalidate(InvalidationType.STYLE);		}		/**		 * @return 		 */		public function get style():Object{			return _styleObject;		}				//提示		/**		 * @param value		 */		public function set tip(value:String):void {			_tip = value;		}		/**		 * @return 		 */		public function get tip():String {			return _tip;		}		//位置		override public function set x(value:Number):void {			super.x = value >> 0;		}		override public function set y(value:Number):void {			super.y = value >> 0;		}		//宽度		override public function set width(value:Number):void {			resize(value, _height);		}		override public function get width():Number {			return _width;		}		//高度		override public function set height(value:Number):void {			resize(_width, value);		}		override public function get height():Number {			return _height;		}		/**		 * @param value		 */		public function set parent(value:DisplayObjectContainer):void{			if(_parent!=value){				_parent=value;			}		}		public function get canValidate():Boolean{			return visible&&_initialized&&(stage!=null);		}	}}