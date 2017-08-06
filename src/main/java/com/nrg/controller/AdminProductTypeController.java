package com.nrg.controller;


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
import org.springframework.web.servlet.ModelAndView;

import com.nrg.entity.ProductType;
import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.service.IProductTypeService;
import com.nrg.service.ISolutionService;
import com.nrg.service.ISolutionTypeService;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/productType")
public class AdminProductTypeController {
	public final static Logger logger=LoggerFactory.getLogger(AdminProductTypeController.class);
	
	
	@Autowired
	private IProductTypeService productTypeService;

	/**
	 * Described 分页列表
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Model model,Integer pageNo,Integer pageSize,@ModelAttribute("productType") ProductType productType){
		ModelAndView mv =new ModelAndView("/product/typeList");
		logger.info("进入解决方案类型的分页列表");
		logger.info(productType.getTypeName());
		mv.addObject("pageBean", productTypeService.getList(productType,pageNo,pageSize));
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public ModelAndView add(Model model,long id){
		ModelAndView mv =new ModelAndView("/product/typeAdd");
		mv.addObject("pageBean", productTypeService.get(id));
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView adds(Model model,@ModelAttribute("productType") ProductType productType){
		productTypeService.insertSelective(productType);
		ModelAndView mv =new ModelAndView("redirect:/admin/productType/list.do");
		return mv;
	}
	
	/**
	 * Described删除
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(Long id){
		productTypeService.deleteById(id);
		//return "/solution/delete";
	}
	
	/**
	 * Described跳转到修改
	 * @return
	 */
	@RequestMapping(value ="/update",method = RequestMethod.GET)
	public String update(){
		return "/product/updateType";
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("productType") ProductType productType){
		productTypeService.update(productType);
		return "redirect:/admin/productType/list.do";
	}
}
