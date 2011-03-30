package aii.ui.styles{
	import aii.ui.controls.*;
	import aii.ui.controls.bases.*;
	import aii.ui.core.UIComponent;
	import aii.ui.graphics.*;
	import aii.ui.graphics.border.SolidBorder;
	
	import flash.filters.*;
	import flash.utils.Dictionary;

	/**
	 * StyleSheet类为组建整体提供了样式表支持，同时内置了一套基本的默认样式。
	 * @author Swfdong
	 */
	public class StyleSheet{
		//
		private var _sheet:Dictionary=new Dictionary();
		/**
		 * 创建一个新的StyleSheet样式表实例。
		 */
		public function StyleSheet(){
			configDefaultSheet();
			configSheet();
		}
		/**
		 * 配置默认样式表。
		 */
		protected function configDefaultSheet():void{
			//全局基本样式
			sheet[UIComponent]={
				fill:new SolidFill({
					color:0xFFFFFF
				}),
				border:new SolidBorder({
					fill:new SolidFill({
						color:0xAAAAAA
					})
				}),
				disabled:{
					fill:new SolidFill({
						color:0xEEEEEE
					}),
					border:new SolidBorder({
						radius:0,
						fill:new SolidFill({
							color:0x999999
						})
					})
				}
			};
			//按钮基本样式
			sheet[ButtonBase]={
				filters:[new DropShadowFilter(1,-90,0x0,0.3,6,4,1,1,true)],
				hover:{
					border:new SolidBorder({
						fill:new SolidFill({
							color:0x3FB600
						})
					}),
					filters:[new GlowFilter(0x3FB600, 1, 2,2,4)]
				},
				active:{
					border:new SolidBorder({
						fill:new SolidFill({
							color:0x3FB600
						})
					}),
					filters:[new DropShadowFilter(2, 90,0x0, 1, 8, 8, 0.3, 1,true),new GlowFilter(0x3FB600, 1, 2,2,4)]
				}
			};
			//带标签按钮样式
			sheet[LabelButtonBase]={
				hover:{
					fontColor:0x2E690E
				},
				active:{
					fontColor:0x2E690E
				}
			};
			//文字组件样式
			sheet[TextBase]={
				fill:new SolidFill({
					color:0xFFFFFF
				}),
				border:new SolidBorder({
					fill:new SolidFill({
						color:0xAAAAAA
					})
				}),
				filters:[new DropShadowFilter(1,90,0x0,0.3,6,4,1,1,true)],
				active:{
					fill:new SolidFill({
						color:0xFFFFFF
					}),
					border:new SolidBorder({
						fill:new SolidFill({
							color:0x3FB600
						})
					}),
					filters:[
						new DropShadowFilter(2,90,0x0,0.3,8,8,1,1,true),
						new GlowFilter(0x3FB600, 1, 2,2,4)
					]
				}
			};
			//复选框样式
			sheet[CheckBox]={
				filters:[new DropShadowFilter(1,90,0x0,0.3,6,4,1,1,true)]
			};
			//单选框样式
			sheet[RadioButton]={
				border:new SolidBorder({
					radius:24,fill:new SolidFill({
						color:0xAAAAAA
					})
				}),
				hover:{
					border:new SolidBorder({
						radius:24,fill:new SolidFill({
							color:0x3FB600
						})
					})
				},
				active:{
					border:new SolidBorder({
						radius:24,fill:new SolidFill({
							color:0x3FB600
						})
					})
				},
				disabled:{
					border:new SolidBorder({
						radius:24,
						fill:new SolidFill({
							color:0x999999
						})
					})
				}
			};
			//滑块样式
			sheet["SliderTrack"]={
				border:new SolidBorder({
					weight:0
				}),
				filters:[],
				fill:new SolidFill({
					color:0x999999,
					alpha:0.3
				}),
				hover:{
					filters:[],
					fill:new SolidFill({
						color:0x999999,
						alpha:0.4
					})
				},
				active:{
					filters:[],
					fill:new SolidFill({
						color:0x999999,
						alpha:0.5
					})
				}
			};
		}
		/**
		 * 配置附加样式表，子类需覆盖该方法进行样式调整。
		 */
		protected function configSheet():void{	
		}
		/**
		 * 获取当前样式表。
		 * @return 当前实例的样式表引用。
		 */
		public function get sheet():Dictionary{
			return _sheet;
		}
	}
}