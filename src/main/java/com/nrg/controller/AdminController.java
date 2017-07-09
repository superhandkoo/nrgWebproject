package com.nrg.controller;

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
	
	@RequestMapping("/loginWeb")
	public String toLoginWeb(){
		return "/adminlogin/loginWeb";
	}
	
	@RequestMapping("/loginExcute")
	@ResponseBody
	public Map<String, Object> loginExcute(HttpServletRequest req){
		Map<String, Object> map=new HashMap<String, Object>();
		User user=new User();
		user.setName(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
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
	
}
