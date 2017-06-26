package com.nrg.chatServer.common;

import java.util.HashMap;
import java.util.Map;

public class NickPool {
	private static Map<String , Object> NICK_POOL=new HashMap<String,Object>();
	
	public static void add(String sessionId, String nickName) {
        NICK_POOL.put(sessionId, nickName);
    }
	
	public static void remove(String sessionId) {
        NICK_POOL.remove(sessionId);
    }

    public static String get(String sessionId) {
        return (String) NICK_POOL.get(sessionId);
    }

    public static Map<String, Object> getNickPool() {
        return NICK_POOL;
    }
}
