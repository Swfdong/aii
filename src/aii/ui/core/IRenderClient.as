package aii.ui.core{
	/**
	 * IRenderClient定义用于执行渲染管理对象的接口，所有使用渲染管理机制的自定义显示对象需实现此接口。
	 * @author Swfdong
	 */
	public interface IRenderClient{
		/**
		 * 立即验证渲染，渲染管理器通过对实现IRenderClient接口的对象内该方法的调用来进行分批渲染。
		 */
		function validate():void;
		/**
		 * 获取实例的渲染状态，渲染管理器通过实现IRenderClient接口的对象内该属性的判断来确定组件是否可以立即验证渲染。
		 */
		function get canValidate():Boolean;
	}
}