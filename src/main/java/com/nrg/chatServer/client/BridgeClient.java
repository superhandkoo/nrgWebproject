package com.nrg.chatServer.client;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nrg.chatServer.common.UserPool;

@ServerEndpoint("init")
public class BridgeClient {
	private static Logger logger=LoggerFactory.getLogger(BridgeClient.class);
	
	@OnOpen
	public void onOpen(Session session){
		//加入用户吃
		UserPool.add(session);
	}
	
	@OnMessage
	public void onMessage(String message,Session session){
		logger.info("user [" + session.getId() + "] Received: "+message);
		System.out.println(message);
	}
	
	@OnError
	public void  onError(Throwable ex){
		logger.info("error:"+ex.getMessage());
	}
	
	@OnClose
	public void onClose(Session session){
		//移除用户池
		UserPool.remove(session.getId());
	}
}
