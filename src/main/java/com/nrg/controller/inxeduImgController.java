package com.nrg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.json.Json;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.nrg.service.ServiceFactory;
import com.nrg.utils.BaseController;

/**
 * 测试的controller类
 * @author cp
 *
 */
@Controller
@RequestMapping("/Image")
@Scope(value="prototype")
public class inxeduImgController extends BaseController{
	
	/**
	 * service的factory类
	 */
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 测试查询所有的图片的controller
	 * @param model
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/banner")
	
	public void getAllimages(HttpServletRequest request,HttpServletResponse response) throws IOException{
		 
		
		//ModelAndView modelview=new ModelAndView();
		//modelview.setViewName("demo");
		System.out.println("banner例子==");
		
		String typeId=request.getParameter("typeId");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter  pw =response.getWriter();
		
		
		pw.write(JSON.toJSON(serviceFactory.getDemoService().kindAllImages(typeId)).toString());
		pw.flush();
		pw.close();
		
		
	}


}
