/* license section

   Aii is free software: you can redistribute it and/or modify
	public final class XNRoster extends EventDispatcher {
		public function XNRoster():void {
		public function set selfID(s:String):void {
		public function save():void {
		public function updateFromIQ(xmlData:XML):void {
		public function updateFromPresence(xmlData:XML):void {
		public function initFriends(objData:Object):void {
		public function initFriendsLoop():void {
		public function initFriendsEnd():void {
		//初始化在线好友(为避免200个以上好友在线时卡的现象,使用TaskMonitor进行处理
		public function updatePendingFriendsEnd():void {
		public function get self():XNCard {
		public function get totalCount():uint {
		public function get onlineCount():uint {
		public function get groupsCount():uint {
		private static function getID(j:String):String {