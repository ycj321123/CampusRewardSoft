package com.sise.ycj.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sise.ycj.model.Publish_msg;
import com.sise.ycj.service.IPublish_msgService;
import com.sise.ycj.util.WebSocketMapService;

@Component
public class MyWebSocketHandler implements WebSocketHandler {
 
	@Resource(name = "publish_msgService")
	private IPublish_msgService publish_msgService;
 
	//握手实现连接后
	public void afterConnectionEstablished(WebSocketSession webSocketSession)
			throws Exception {
		String userAccount =(String) webSocketSession.getAttributes().get("userAccount");
		if (WebSocketMapService.get(userAccount) == null) {
			WebSocketMapService.put(userAccount, webSocketSession);
		}
		System.out.println("啊士大夫十分也会萨多夫阿萨恢复擦拭第三地方"+userAccount);
	}
 
	//发送信息前的处理
	public void handleMessage(WebSocketSession webSocketSession,
			WebSocketMessage<?> webSocketMessage) throws Exception {
		System.out.println("555555555555555555555555555555555555555555555555555555");
		if (webSocketMessage.getPayloadLength() == 0)
			return;
		//获取Socket通道中的数据
		JSONObject object = JSONObject
				.parseObject(webSocketMessage.getPayload().toString());
		Publish_msg messageInfo =new Gson().fromJson(webSocketMessage.getPayload().toString(),Publish_msg.class);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		Date now = new Date();
		String time = sdf2.format(now); // 获取当前时间   
		messageInfo.setpTime(time);

		//将信息保存至数据库
		publish_msgService.add(messageInfo);

		// 给对方发送消息
		sendMessageToUser(messageInfo.getpAccount(),
				new TextMessage(
						new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
								.create().toJson(messageInfo)));
	}
 
	public void handleTransportError(WebSocketSession webSocketSession,
			Throwable throwable) throws Exception {
		

	}
 
	public void afterConnectionClosed(WebSocketSession webSocketSession,
			CloseStatus closeStatus) throws Exception {
		System.out.println("6666666666666666666666666666666666666666666666666666666");
		//断开连接即将此用户对应的WebSocketSession移除，以便再次连接时添加新的WebSocketSession
		Iterator<Map.Entry<String, WebSocketSession>> iterator = WebSocketMapService
				.entrySet().iterator();
		while (iterator.hasNext()) {
			Map.Entry<String, WebSocketSession> entry = iterator.next();
			if (entry.getValue().getAttributes()
					.get("userAccount") == webSocketSession.getAttributes()
							.get("userAccount")) {
				WebSocketMapService.remove((String) webSocketSession
						.getAttributes().get("userAccount"));
			}
		}
		System.out.println("7777777777777777777777777777777777777777777777777777");

	}
 
	public boolean supportsPartialMessages() {
		return false;
	}
 
	//发送信息的实现
	public void sendMessageToUser(String userId, TextMessage message)
			throws IOException {
		WebSocketSession session = WebSocketMapService.get(userId);
		if (session != null && session.isOpen()) {
			session.sendMessage(message);
		}
		System.out.println("888888888888888888888888888888888888888888888888888888888888888888");

	}
}