package com.nrg.chatServer.common;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.nrg.chatServer.client.BridgeClient;

public class UserPool {
	private static Logger logger=LoggerFactory.getLogger(BridgeClient.class);
	
	private static Map<String,Object> USER_POOL=new HashMap<String,Object>();
	
	public static void add(Session session){
		USER_POOL.put(session.getId(), session);
		logger.info("user [" + session.getId() + "] connected");
	}
	
	public static void remove(String sessionId){
		USER_POOL.remove(sessionId);
		logger.info("user [" + sessionId + "] closed");
	}

	 public static Session get(String sessionId) {
		 return (Session) USER_POOL.get(sessionId);
	 }

	 public static Map<String, Object> getUserPool() {
		 return USER_POOL;
	 }
}
