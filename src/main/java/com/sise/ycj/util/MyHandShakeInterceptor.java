package com.sise.ycj.util;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;

import com.sise.ycj.model.User;

@Component
public class MyHandShakeInterceptor implements HandshakeInterceptor {
	 
	public boolean beforeHandshake(ServerHttpRequest serverHttpRequest,
			ServerHttpResponse serverHttpResponse,
			WebSocketHandler webSocketHandler, Map<String, Object> map)
			throws Exception {
		if (serverHttpRequest instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) serverHttpRequest;
			HttpSession session = servletRequest.getServletRequest()
					.getSession(false);
			// 获取登录时保存到session中的用户信息
			User user = (User) session.getAttribute("loginUser");
			if (user != null) {
				map.put("userAccount", user.getAccount());//为服务器创建WebSocketSession做准备
				System.out.println(user.getAccount()+"0000000000000000000000000000000000000000000000000000000000000000000000000");
			} else {
				System.out.println(user.getAccount()+"111111111111111111111111111111111111111111111111111111111111111111111111");
				return false;
			}
		}
		System.out.println("22222222222222222222222222222222222222222222222222222222222222222222");

		return true;
	}
 
	public void afterHandshake(ServerHttpRequest serverHttpRequest,
			ServerHttpResponse serverHttpResponse,
			WebSocketHandler webSocketHandler, Exception e) {
 
	}
}