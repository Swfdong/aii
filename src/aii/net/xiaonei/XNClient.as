/* license section

   Aii is free software: you can redistribute it and/or modify
	public final class XNClient extends EventDispatcher {
		//初始化
		//[调试用]发送XML数据
		//登录
		//修改状态
		//获取好友资料
		//跳转
		//储存资料
		public function get roster():XNRoster {
		public function get status():String {
		/////////////////////私有方法//////////////////////////
		//XMPP连接侦听
		/////////////////////////回调//////////////////////////
		//登录失败
		//开始发送IQ
		//从服务器获取新JID&TICKET
		//收到Session
		//收到个人信息
		//收到用户列表
		private function receivedIQ(xmlData:XML):void {
		private function receivedPresence(xmlData:XML):void {
		private function receivedMessage(xmlData:XML):void {