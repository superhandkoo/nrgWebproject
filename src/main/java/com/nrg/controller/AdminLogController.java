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
@RequestMapping("/admin/log")
public class AdminLogController {
	
	/**
	 * service的factory类
	 */
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * Described 分页列表
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		return "/log/list";
	}
	
	/**
	 * Described 添加banner
	 * @return
	 */
	@RequestMapping("/query")
	public String add(){
		return "/log/list";
	}
	
}
