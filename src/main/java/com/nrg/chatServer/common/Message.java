package com.nrg.chatServer.common;

import java.io.IOException;
import java.util.Set;

import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nrg.chatServer.entity.Text;
import com.nrg.chatServer.util.JsonUtil;

public class Message {
	private static Logger logger=LoggerFactory.getLogger(UserPool.class);
	
	
	public void sendOneUser(String message,Session one){
		
		
	}
	
	public void sendAllUsers(String message,Session all){
		//从昵称池拿出用户昵称
        Text text = JsonUtil.getBean(message, Text.class);
        text.setUserName(NickPool.get(all.getId()));
		//判断是否是需要执行的脚本，是则return，由代理处理脚本
        if(CMD.isCMD(text.getMessage())) {
            return;
        }
        //给所有用户发送消息
        Set<String> keys = UserPool.getUserPool().keySet();
        for(String key : keys) {
        	Session session = (Session) UserPool.get(key);
        	//屏蔽状态关闭的用户
        	if(!session.isOpen()) {
        		UserPool.remove(session.getId());
        		continue;
        	}
        	//排除自己
        	if(session.equals(all)) {
        		continue;
        	}
        	try {
        		//发送消息
        		session.getBasicRemote().sendText(JsonUtil.getString(text));
        	} catch (IOException e) {
        		logger.error("给用户 [" + session.getId() + "] 发送消息失败", e);
        	}
        }
	}
	
}
