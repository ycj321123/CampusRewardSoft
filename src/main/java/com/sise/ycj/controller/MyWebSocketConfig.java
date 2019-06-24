package com.sise.ycj.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.sise.ycj.service.impl.MyWebSocketHandler;
import com.sise.ycj.util.MyHandShakeInterceptor;



@Component
@EnableWebSocket
@ServerEndpoint("/ws") 
public class MyWebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer
	 {

    @Autowired
	MyWebSocketHandler myWebSocketHandler;
 
	public void registerWebSocketHandlers(
			WebSocketHandlerRegistry webSocketHandlerRegistry) {
		System.out.println("4444444444444444444444444444444444444444444444444444444444444");
		//添加websocket处理器，添加握手拦截器
		webSocketHandlerRegistry.addHandler(myWebSocketHandler, "/ws")
				.addInterceptors(new MyHandShakeInterceptor());

	}
}