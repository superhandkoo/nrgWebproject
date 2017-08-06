package com.nrg.controller;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nrg.entity.ProductType;
import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.service.IProductTypeService;
import com.nrg.service.ISolutionService;
import com.nrg.service.ISolutionTypeService;
import com.nrg.utils.BaseController;
import com.nrg.utils.DateUtil;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/productType")
public class AdminProductTypeController extends BaseController{
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
	public ModelAndView add(Model model){
		ModelAndView mv =new ModelAndView("/product/typeAdd");
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView adds(Model model,@ModelAttribute("productType") ProductType productType,
		HttpServletRequest request){
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		productType.setCreatedBy(Integer.valueOf(userId));
		productType.setCreatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		productTypeService.insertSelective(productType);
		ModelAndView mv =new ModelAndView("redirect:/admin/productType/list.do");
		return mv;
	}
	
	/**
	 * 下架
	 * @return
	 */
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	@ResponseBody
	public String delete(@RequestParam("id") Long id){
		logger.info(""+id);
		String code = "success";
		try {
			productTypeService.deleteById(id);
		} catch (Exception e) {
			logger.error("逻辑删除报错：", e);
			code = "error";
		} 
		return code;
	}
	
	
	/**
	 * @Description 物理删除
	 * @param id 主键id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/remove",method=RequestMethod.GET)
	@ResponseBody
	public String physicsDelete(@RequestParam("id") Long id) {
		String code = "success";
		try {
			productTypeService.remove(id);
		} catch (Exception e) {
			logger.error("物理删除报错：", e);
			code = "error";
		} 
		return code;
	}
	

	/**
	 * Described跳转到修改
	 * @return
	 */
	@RequestMapping(value ="/update",method = RequestMethod.GET)
	public ModelAndView update(@ModelAttribute("id")Long id){
		ModelAndView mv =new ModelAndView("/product/updateType");
		mv.addObject("pageBean", productTypeService.get(id));
		return mv;
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("productType") ProductType productType,
		HttpServletRequest request){
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		productType.setUpdatedBy(Integer.valueOf(userId));
		productType.setUpdatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		productTypeService.update(productType);
		return "redirect:/admin/productType/list.do";
	}
}
