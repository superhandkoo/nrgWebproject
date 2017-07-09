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
@RequestMapping("/admin/user")
public class AdminUserController {
	
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
		return "/user/list";
	}
	
	/**
	 * Described 添加banner
	 * @return
	 */
	@RequestMapping("/add")
	public String add(){
		return "/user/add";
	}
	
	/**
	 * Described删除
	 * @return
	 */
	@RequestMapping("/delete")
	public String delete(){
		return "/user/delete";
	}
	
	/**
	 * Described跳转到修改
	 * @return
	 */
	@RequestMapping("/update")
	public String update(){
		return "/user/update";
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping("/updateadd")
	public String updateadd(){
		
		return "redirect:/admin/user/list.do";
	}
	
}
