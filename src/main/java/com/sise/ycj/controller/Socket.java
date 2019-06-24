package com.sise.ycj.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.sise.ycj.model.Publish_msg;
import com.sise.ycj.service.IPublish_msgService;
import com.sise.ycj.service.impl.Publish_msgService;

@Controller("socket")
@ServerEndpoint("/websocket")
public class Socket {
    public static Map<String, Session> sessionMap = new HashMap<String, Session>();
    private Session session;
    
    @OnOpen
    public void startSocket(Session session) {
        this.session = session;
        System.out.println(this.session + "链接成功");
        
        if (sessionMap.size() == 0) {
            return ;
        }
        /*
        Set userIds = sessionMap.keySet();
        StringBuffer sBuffer  = new StringBuffer();
        for (Object str : userIds) {
            sBuffer.append(str.toString() + ":");
        }
        Gson gson = new Gson();
      
        try {
            Publish_msg message = new Publish_msg();
            message.setpAccount("15627933457");
            message.setpContent(sBuffer.toString());
            message.setSendToWho("13580152965");
            session.getBasicRemote().sendText(gson.toJson(message),true);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }*/
    }

    @OnMessage
    public void getMessgae(Session session, String str, boolean last) {
        if (session.isOpen()) {
            try {
                System.out.println(str);
                Gson gson = new Gson();
                Publish_msg msg = gson.fromJson(str, Publish_msg.class);
                Publish_msg toMessage = msg;
                toMessage.setpAccount(msg.getpAccount());
                toMessage.setSendToWho(msg.getSendToWho());
                
                SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
        		Date now = new Date();
        		String pTime = sdf2.format(now); // 获取当前时间 
                toMessage.setpTime(pTime);
                
               
               /* if(publish_msgService==null){
                	System.out.println("wsmasdgadasidi53456454sdcfsd5");
                }*/
                
                //是否刚连接socket
                if (msg.getpContent().equals("newUser")) {
                    if (sessionMap.containsKey(msg.getpAccount())) {
                        sessionMap.remove(msg.getpAccount());	//存在该用户则移除
                    }
                    sessionMap.put(msg.getpAccount(), session);		//不存在则添加连接
                } else {	
                	//不是第一次连接 //不管用户是否离线，都可以发送消息
                    Session toSession = sessionMap.get(msg.getSendToWho());
                    //用户已连接并且打开连接
                    if (toSession != null && toSession.isOpen()) {
                        toSession.getBasicRemote().sendText(gson.toJson(toMessage).toString(), last);
                    } else {
                    	//用户断开连接
                        //toMessage.setpContent("离线");
                        session.getBasicRemote().sendText(gson.toJson(toMessage).toString(), last);
                    }
                }
                
                
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        } else {
            System.out.println("session is closed");
        }
    }
    
    @OnError
    public void onError(Session session,Throwable error){
    	error.printStackTrace();
    }
}