package com.nrg.chatServer.util;

import java.io.IOException;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JsonUtil {
	 private static ObjectMapper mapper = new ObjectMapper();
	 private static Logger logger=LoggerFactory.getLogger(JsonUtil.class);
	 
	 /**
	     * 对象toJSON
	     * @param object
	     * @return
	     */
	public static String getString(Object object) {
		try {
			return mapper.writeValueAsString(object);
	    } catch (JsonProcessingException e) {
	    	logger.info("JsonProcessingException"+e);
	    	e.printStackTrace();
	    	return "";
	    }catch (Exception e) {
	    	logger.info("Exception"+e);
	    	e.printStackTrace();
	    	return "";
		}
	 }
	
	/**
     * json转换Bean
     * @param json
     * @param clazz
     * @param <T>
     * @return
     */
    public static <T> T getBean(String json, Class<T> clazz) {
        try {
            return mapper.readValue(json, clazz);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
