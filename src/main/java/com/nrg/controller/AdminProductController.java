package com.nrg.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nrg.entity.Product;
import com.nrg.entity.Solution;
import com.nrg.service.IProductService;
import com.nrg.service.ISolutionService;
import com.nrg.service.ServiceFactory;
import com.nrg.vo.User;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/product")
public class AdminProductController {
	public final static Logger logger=LoggerFactory.getLogger(AdminSolutionController.class);
	
	@Autowired
	private IProductService productService;
	
	
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Model model,Integer pageNo,Integer pageSize,@ModelAttribute("product") Product product){
		ModelAndView mv =new ModelAndView("/product/list");
		logger.info("进入解决方案的分页列表");
		mv.addObject("pageBean", productService.getList(product,pageNo,pageSize));
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public ModelAndView add(Model model){
		ModelAndView mv =new ModelAndView("/product/Add");
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView adds(Model model,@ModelAttribute("product") Product product){
		productService.insertSelective(product);
		ModelAndView mv =new ModelAndView("redirect:/admin/product/list.do");
		return mv;
	}
	
	/**
	 * Described删除
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(Long id){
		productService.deleteById(id);
		//return "/solution/delete";
	}
	
	/**
	 * Described跳转到修改
	 * @return
	 */
	@RequestMapping(value ="/update",method = RequestMethod.GET)
	public String update(){
		return "/solution/update";
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("product") Product product){
		productService.update(product);
		return "redirect:/admin/solution/list.do";
	}
}
