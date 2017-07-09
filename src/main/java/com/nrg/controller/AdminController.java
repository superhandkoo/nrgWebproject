package com.nrg.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nrg.service.ServiceFactory;
import com.nrg.vo.User;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin")
public class AdminController {
	
	/**
	 * service的factory类
	 */
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 跳转后台登录页面
	 * @return
	 */
	@RequestMapping("/loginWeb")
	public String toLoginWeb(){
		return "/adminlogin/loginWeb";
	}
	/**
	 * 后台执行登录
	 * @param req
	 * @return
	 */
	@RequestMapping("/loginExcute")
	@ResponseBody
	public Map<String, Object> loginExcute(HttpServletRequest req){
		Map<String, Object> map=new HashMap<String, Object>();
		User user=new User();
		user.setName(req.getParameter("username"));
		user.setPassword(req.getParameter("password").substring(8,16));
		Boolean flag=false;
		try {
			flag = serviceFactory.getUserService().checkLoginUser(user);
			map.put("flag", flag);
			if(!flag){
				map.put("message", "您的账户或密码有误");
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", false);
			map.put("message", "未知错误,请稍后重试");
		}
		return map;
	}
	
	/**
	 * 后台注册
	 * @param req
	 * @return
	 */
	@RequestMapping("/registExcute")
	@ResponseBody
	public Map<String, Object> registExcute(HttpServletRequest req){
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			//用户名唯一性检测
			String userName=req.getParameter("username");
			Boolean userNameFlag=serviceFactory.getUserService().checkUserName(userName);
			if(userNameFlag){
				map.put("flag",false );
				map.put("message", "您的用户名已被注册");
				return map;
			}
			//手机号唯一性检测
			String mobile=req.getParameter("mobile");
			Boolean mobileFlag=serviceFactory.getUserService().checkMobile(mobile);
			if(mobileFlag){
				map.put("flag",false );
				map.put("message", "您的手机已被注册");
				return map;
			}
			//
			String password=req.getParameter("password").substring(8,16);
			User user =new User();
			user.setAddtime(new Date());
			user.setMobile(mobile);
			user.setName(userName);
			user.setPassword(password);
			serviceFactory.getUserService().createUser(user);
			System.out.println("id:"+user.getUserId());
			//防入缓存
			
			
			
			
			
			
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", false);
			map.put("message", "未知错误,请稍后重试");
		}
		return map;
	}
	
	
}
