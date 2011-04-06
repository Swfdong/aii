package aii.ui.core {
	/**	 * InvalidationType类使用一系列静态常量持有组件的重绘类型。	 * @author Swfdong	 */	public class InvalidationType {		/**
		 * 重绘全部内容。
		 * @default 255
		 */
		public static const ALL:uint = 255;		/**
		 * 重绘组件整体布局。
		 * @default 64
		 */
		public static const LAYOUT:uint = 64;		/**
		 * 重绘组件滚动部分。
		 * @default 32
		 */
		public static const SCROLL:uint = 32;		/**
		 * 重绘组件属性。
		 * @default 16
		 */
		public static const PROPERTY:uint = 16;		/**
		 * 重绘组件文本。
		 * @default 8
		 */
		public static const TEXT:uint = 8;
		/**
		 * 重绘组件状态或尺寸，重绘状态时往往包括了重绘尺寸的内容，为了优化效率，特定义此常量。
		 * @default 3
		 */
		public static const STATE_OR_SIZE:uint=3;		/**
		 * 重绘组件尺寸。
		 * @default 2
		 */
		public static const SIZE:uint = 2;		/**
		 * 重绘组件状态。
		 * @default 1
		 */
		public static const STATE:uint = 1;		/**
		 * 重绘组件样式，与重绘状态所需的代码一致，故实际值也一致。
		 * @default 1
		 */
		public static const STYLE:uint = 1;	}}