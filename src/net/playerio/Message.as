﻿package net.playerio	import flash.utils.ByteArray	/**	 * Message object either sent or received from the server 	 * 	 */	public interface Message {		/**		 * Adds data entry to the Message object 		 * @param args Entries to add. Valid types are Number, int, uint, String, Boolean and ByteArray		 * @example How to add values to a message		 * <listing version="3.0">		 * message.add("This is a chat message", 3)		 * </listing>		 */		function add(...args:*):void;		/**		 * Reads a number from the message object at index		 * @param index The index of the value to be read		 * @return Number		 * 		 */		function getNumber(index:int):Number;		/**		 * Reads an int from the message object at index		 * @param index The index of the value to be read		 * @return int		 * 		 */		function getInt(index:int):int;		/**		 * Reads an uint from the message object at index		 * @param index The index of the value to be read		 * @return uint		 * 		 */		function getUInt(index:int):uint;		/**		 * Reads a String from the message object at index		 * @param index The index of the value to be read		 * @return String		 * 		 */		function getString(index:int):String;		/**		 * Reads a Boolean from the message object at index		 * @param index The index of the value to be read		 * @return Boolean		 * 		 */		function getBoolean(index:int):Boolean;		/**		 * Reads a ByteArray from the message object at index		 * @param index The index of the value to be read		 * @return ByteArray		 * 		 */		function getByteArray(index:int):ByteArray;		/**		 * Gets the length of the message 		 * @return A count of how many data entities the message contains		 * 		 */		function get length():int;		/**		 * The type of the message 		 * @return The type of the message as a String		 * 		 */		function get type():String;		/**		 * Sets the message of the tyoe 		 * @param type The type of the message		 * 		 */		function set type(type:String):void;		/**		 * Shows a human readable serialization of the message 		 * @return String		 * 		 */		function toString():String;	}}