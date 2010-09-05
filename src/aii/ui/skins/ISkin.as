package aii.ui.skins{
	import aii.ui.core.IRenderClient;

	/**
	 * ISkin定义用于UI组件皮肤的接口。
	 * @author Swfdong
	 */
	public interface ISkin extends IRenderClient{
		function setStyles(args:Object):void;
		function resize(width:Number,height:Number):void;
		function get x():Number;
		function set x(value:Number):void;
		function get y():Number;
		function set y(value:Number):void;
		function get state():uint;
		function set state(value:uint):void;
	}
}