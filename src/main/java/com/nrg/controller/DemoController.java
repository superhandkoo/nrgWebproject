package com.nrg.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nrg.service.ServiceFactory;
import com.nrg.utils.BaseController;

/**
 * 测试的controller类
 * @author cp
 *
 */
@Controller
@RequestMapping("/demo")
@Scope(value="prototype")
public class DemoController extends BaseController{
	
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
	 */
	@RequestMapping("/img")
	public ModelAndView getAllimages(Model model,Integer pageNo,Integer pageSize){
		model.addAttribute("pageBean", serviceFactory.getDemoService().queryAllImage(pageNo, pageSize));
		return new ModelAndView("demo");
	}
}
