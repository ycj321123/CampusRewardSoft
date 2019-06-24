package com.sise.ycj.util;

import java.util.Collection;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.springframework.web.socket.WebSocketSession;

public class WebSocketMapService {
	public static final ConcurrentMap<String, WebSocketSession> webSocketSessionMap;
	static {
		webSocketSessionMap = new ConcurrentHashMap<String, WebSocketSession>();
	}
 
	public static void put(String key, WebSocketSession myWebSocket) {
		webSocketSessionMap.put(key, myWebSocket);
	}
 
	public static WebSocketSession get(String key) {
		return webSocketSessionMap.get(key);
	}
 
	public static void remove(String key) {
		webSocketSessionMap.remove(key);
	}
 
	public static Collection<WebSocketSession> getValues() {
		return webSocketSessionMap.values();
	}
 
	public static Set<Entry<String, WebSocketSession>> entrySet() {
		return webSocketSessionMap.entrySet();
	}
}
