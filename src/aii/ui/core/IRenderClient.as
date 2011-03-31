package aii.ui.core{
	/**
	 * IRenderClient定义用于执行渲染管理对象的接口，所有使用渲染管理机制的自定义显示对象需实现此接口。
	 * @author Swfdong
	 */
	public interface IRenderClient{
		
		function validate():void;
		function get canValidate():Boolean;
	}
}