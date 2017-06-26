package com.nrg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nrg.service.ServiceFactory;
import com.nrg.utils.BaseController;
@Controller
@RequestMapping("/chat")
@Scope(value="prototype")
public class ChatController extends BaseController{
	/**
	 * service的factory类
	 */
	@Autowired
	private ServiceFactory serviceFactory;
	
	@RequestMapping("/web")
	public ModelAndView clientWeb(){
		//model.addAttribute("pageBean", serviceFactory.getDemoService().queryAllImage(pageNo, pageSize));
		System.out.println("1111");
		return new ModelAndView("onlineChat/chat");
	}
}
