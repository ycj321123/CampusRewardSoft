package com.sise.ycj.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

/**
 * Created by Administrator on 2017/9/29 0029.
 */
public class EmailHelper {
	//密码：civijwecyafefhde

	public static void sendEmail(String qqemail,String subject,String content) throws Exception {

        Properties props = new Properties();
        
           // 开启debug调试
           props.setProperty("mail.debug", "true");
           // 发送服务器需要身份验证
           props.setProperty("mail.smtp.auth", "true");
           // 设置邮件服务器主机名
           props.setProperty("mail.host", "smtp.qq.com");
           // 发送邮件协议名称
           props.setProperty("mail.transport.protocol", "smtp");
        
           MailSSLSocketFactory sf = new MailSSLSocketFactory();
           sf.setTrustAllHosts(true);
           props.put("mail.smtp.ssl.enable", "true");
           props.put("mail.smtp.ssl.socketFactory", sf);
        
           Session session = Session.getInstance(props);
        
           Message msg = new MimeMessage(session);
           //主题
           msg.setSubject(subject);
           //内容
           msg.setText(content);
           //发送人
           msg.setFrom(new InternetAddress("1297815658@qq.com"));
           //连接
           Transport transport = session.getTransport();
           transport.connect("smtp.qq.com", "1297815658@qq.com", "civijwecyafefhde");
           //发送
           transport.sendMessage(msg, new Address[] { new InternetAddress(qqemail) });
           transport.close();	//关闭
     }
	
	//生成随机数
	public static String getCode(){
		String code="";
		Random r = new Random();
		for(int i=0;i<6;i++){
			code=code+r.nextInt(10);
		}
		return code;
	}
}