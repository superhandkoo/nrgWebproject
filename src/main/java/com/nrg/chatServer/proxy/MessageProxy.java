package com.nrg.chatServer.proxy;

import java.lang.reflect.Method;

import javax.websocket.Session;

import org.springframework.cglib.proxy.Enhancer;
import org.springframework.cglib.proxy.MethodInterceptor;
import org.springframework.cglib.proxy.MethodProxy;

import com.nrg.chatServer.common.CMD;
import com.nrg.chatServer.common.NickPool;
import com.nrg.chatServer.entity.Text;
import com.nrg.chatServer.util.JsonUtil;

public class MessageProxy implements MethodInterceptor{
	private static MessageProxy messageProxy = new MessageProxy();
	
	public <T> T getProxy(Class<T> clazz) {
        return (T) Enhancer.create(clazz, this);
    }

    public static MessageProxy getInstance() {
        return messageProxy;
    }
	
	@Override
	public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy) throws Throwable {
		Object result = methodProxy.invokeSuper(o, objects);
		 //如果是发送消息方法
        if(method.getName().equals("sendOneUser")||method.getName().equals("sendAllUsers")) {
            return nickNameIntercept(result, o, objects, methodProxy);
        }

        return result;
	}
	 /**
     * 创建昵称拦截
     * @param o
     * @param objects
     * @param methodProxy
     * @return
     * @throws Throwable
     */
    private Object nickNameIntercept(Object result, Object o, Object[] objects, MethodProxy methodProxy) throws Throwable {
        String message = (String) objects[0];
        Session session = (Session) objects[1];
        Text text = JsonUtil.getBean(message, Text.class);
        message = text.getMessage();
        if(!message.startsWith(CMD.USER_NAME_CREATE)) {
            return result;
        }
        String nickName = message.replace(CMD.USER_NAME_CREATE, "");
        text.setMessage(nickName + " is Joined");
        NickPool.add(session.getId(), nickName);

        objects[0] = JsonUtil.getString(text);
        return  methodProxy.invokeSuper(o, objects);
    }
}
