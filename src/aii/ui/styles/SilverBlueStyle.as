package aii.ui.styles{
	import aii.ui.controls.*;
	import aii.ui.controls.bases.*;
	import aii.ui.core.UIComponent;
	import aii.ui.graphics.*;
	import aii.ui.graphics.border.*;
	
	import flash.filters.*;
	/**
	 * SilverBlueStyle类为组建整体提供了一套银蓝风格的样式。
	 * @author Swfdong
	 */
	public class SilverBlueStyle extends StyleSheet{
		public function SilverBlueStyle(){
			super();
		}
		override protected function configSheet():void{
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
						fill:new SolidFill({
							color:0x999999
						})
					})
				}
			};
			//按钮基本样式
			sheet[ButtonBase]={
				fill:new GradientFill({
					colors:[0xFFFFFF,0xF9F9F9,0xE9E9E9,0xF0F0F0],
					alphas:[1,1,1,1],
					ratios:[32,125,145,255],
					rotation:90
				}),
				border:new DoubleBorder({
					radius:3,
					space:0,
					fill:new GradientFill({
						colors:[0xAAAAAA,0x888888,0x999999],
						alphas:[1,1,1],
						ratios:[0,140,255],
						rotation:90
					}),
					innerBorder:new SolidBorder({
						radius:2,
						fill:new GradientFill({
							colors:[0xFFFFFF,0xFFFFFF],
							alphas:[1,0.5],
							ratios:[20,240],
							rotation:90
						})
					})
				}),
				filters:[new DropShadowFilter(1,90,0x000099,0.2,3,3,1,1)],
				hover:{
					border:new DoubleBorder({
						radius:3,
						space:0,
						fill:new GradientFill({
							colors:[0x46B2FF,0x006BFF,0x279AFF],
							alphas:[1,1,1],
							ratios:[0,140,255],
							rotation:90
						}),
						innerBorder:new SolidBorder({
							radius:2,
							fill:new GradientFill({
								colors:[0xFFFFFF,0xFFFFFF],
								alphas:[0.6,0.2],
								ratios:[20,240],
								rotation:90
							})
						})
					}),
					filters:[new GlowFilter(0x279AFF, 0.5, 5,5,1)]
				},
				active:{
					fill:new GradientFill({
						colors:[0xD0EAFF,0x9CD4FF,0x73C2F9,0xBFEDF6],
						alphas:[1,1,1,1],
						ratios:[32,125,145,255],
						rotation:90
					}),
					border:new DoubleBorder({
						radius:3,
						space:0,
						fill:new GradientFill({
							colors:[0x46B2FF,0x006BFF,0x279AFF],
							alphas:[1,1,1],
							ratios:[0,140,255],
							rotation:90
						}),
						innerBorder:new SolidBorder({
							radius:2,
							fill:new GradientFill({
								colors:[0xFFFFFF,0xFFFFFF],
								alphas:[0.6,0.2],
								ratios:[20,240],
								rotation:90
							})
						})
					}),
					filters:[new DropShadowFilter(1,90,0x000099,0.2,2,2,1,1)]
				}
			};
			//带标签按钮样式
			sheet[LabelButtonBase]={
				hover:{
					fontColor:0x0379BB
				},
				active:{
					fontColor:0x175785
				}
			};
			//文字组件样式
			sheet[TextBase]={
				fill:new SolidFill({
					color:0xFFFFFF
				}),
				border:new SolidBorder({
					radius:3,
					fill:new SolidFill({
						color:0xAAAAAA
					})
				}),
				filters:[new DropShadowFilter(1,90,0x0,0.3,6,4,1,1,true)],
				active:{
					border:new SolidBorder({
						radius:3,
						fill:new GradientFill({
							colors:[0x46B2FF,0x006BFF,0x279AFF],
							alphas:[1,1,1],
							ratios:[0,140,255],
							rotation:90
						})
					}),
					filters:[
						new DropShadowFilter(2,90,0x02395F,0.4,6,6,1,2,true),
						new GlowFilter(0x279AFF, 0.5, 5,5,1)
					]
				}
			};
			//复选框样式
			sheet[CheckBox]={
				fill:new GradientFill({
					colors:[0xFFFFFF,0xF0F0F0,0xE9E9E9,0xF0F0F0],
					alphas:[1,1,1,1],
					ratios:[32,125,145,255],
					rotation:90
				}),
				border:new DoubleBorder({
					radius:3,
					space:0,
					fill:new GradientFill({
						colors:[0xAAAAAA,0x888888,0x999999],
						alphas:[1,1,1],
						ratios:[0,140,255],
						rotation:90
					}),
					innerBorder:new SolidBorder({
						radius:2,
						fill:new GradientFill({
							colors:[0xFFFFFF,0xFFFFFF],
							alphas:[1,0.5],
							ratios:[20,240],
							rotation:90
						})
					})
				})
			};
			//单选框样式
			sheet[RadioButton]={
				border:new DoubleBorder({
					radius:24,
					space:0,
					fill:new GradientFill({
						colors:[0xAAAAAA,0x888888,0x999999],
						alphas:[1,1,1],
						ratios:[0,140,255],
						rotation:90
					}),
					innerBorder:new SolidBorder({
						radius:24,
						fill:new GradientFill({
							colors:[0xFFFFFF,0xFFFFFF],
							alphas:[1,0.5],
							ratios:[20,240],
							rotation:90
						})
					})
				}),
				hover:{
					border:new DoubleBorder({
						radius:24,
						space:0,
						fill:new GradientFill({
							colors:[0x46B2FF,0x006BFF,0x279AFF],
							alphas:[1,1,1],
							ratios:[0,140,255],
							rotation:90
						}),
						innerBorder:new SolidBorder({
							radius:24,
							fill:new GradientFill({
								colors:[0xFFFFFF,0xFFFFFF],
								alphas:[0.6,0.2],
								ratios:[20,240],
								rotation:90
							})
						})
					}),
					filters:[new GlowFilter(0x279AFF, 0.5, 5,5,1)]
				},
				active:{
					fill:new GradientFill({
						colors:[0xD0EAFF,0x9CD4FF,0x69C9FF,0xBFEDF6],
						alphas:[1,1,1,1],
						ratios:[32,125,145,255],
						rotation:90
					}),
					border:new DoubleBorder({
						radius:24,
						space:0,
						fill:new GradientFill({
							colors:[0x46B2FF,0x006BFF,0x279AFF],
							alphas:[1,1,1],
							ratios:[0,140,255],
							rotation:90
						}),
						innerBorder:new SolidBorder({
							radius:24,
							fill:new GradientFill({
								colors:[0xFFFFFF,0xFFFFFF],
								alphas:[0.6,0.2],
								ratios:[20,240],
								rotation:90
							})
						})
					}),
					filters:[new DropShadowFilter(1,90,0x000099,0.2,2,2,1,1)]
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
					radius:3,
					fill:new SolidFill({
						color:0xAAAAAA
					})	
				}),
				filters:[new DropShadowFilter(2, 90,0x333333, 1, 8, 6, 0.3, 1,true)],
				fill:new SolidFill({
					color:0xDDDDDD
				}),
				hover:{
					fill:new SolidFill({
						color:0xDDDDDD
					})
				},
				active:{
					fill:new SolidFill({
						color:0xCCCCCC
					})
				}
			};
			//列表样式
			sheet[List]={
				border:new SolidBorder({
					radius:3,
					fill:new SolidFill({
						color:0xAAAAAA
					})
				})
			}
			sheet["ListSliderTrack"]={
				border:new SolidBorder({
					weight:0
				}),
				filters:[],
				fill:new SolidFill({
					color:0x999999,
					alpha:0.2
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
	}
}