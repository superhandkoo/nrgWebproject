package com.nrg.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nrg.entity.Product;
import com.nrg.entity.Solution;
import com.nrg.service.IProductService;
import com.nrg.service.ISolutionService;
import com.nrg.service.ServiceFactory;
import com.nrg.utils.BaseController;
import com.nrg.utils.DateUtil;
import com.nrg.vo.User;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/product")
public class AdminProductController extends BaseController{
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
	public ModelAndView adds(Model model,
			@ModelAttribute("product") Product product,
			HttpServletRequest request){
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		product.setCreatedBy(Integer.valueOf(userId));
		product.setCreatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		productService.insertSelective(product);
		ModelAndView mv =new ModelAndView("redirect:/admin/product/list.do");
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
			productService.deleteById(id);
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
			productService.remove(id);
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
		ModelAndView mv =new ModelAndView("/product/update");
		mv.addObject("pageBean", productService.get(id));
		return mv;
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("product") Product product,
		HttpServletRequest request){
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		product.setUpdatedBy(Integer.valueOf(userId));
		product.setUpdatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		productService.update(product);
		return "redirect:/admin/product/list.do";
	}
}
