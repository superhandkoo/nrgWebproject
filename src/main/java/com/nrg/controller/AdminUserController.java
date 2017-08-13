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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nrg.entity.ProductType;
import com.nrg.service.IProductTypeService;
import com.nrg.service.IUserService;
import com.nrg.service.ServiceFactory;
import com.nrg.utils.DateUtil;
import com.nrg.vo.User;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/user")
public class AdminUserController {
	
public final static Logger logger=LoggerFactory.getLogger(AdminProductTypeController.class);
	
	
	@Autowired
	private IUserService userService;

	/**
	 * Described 分页列表
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Model model,Integer pageNo,Integer pageSize,@ModelAttribute("user") User user){
		ModelAndView mv =new ModelAndView("/user/list");
		logger.info("进入用户的分页列表");
		mv.addObject("pageBean", userService.getList(user,pageNo,pageSize));
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public ModelAndView add(Model model){
		ModelAndView mv =new ModelAndView("/user/add");
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView adds(Model model,@ModelAttribute("user") User user,
		HttpServletRequest request){
		userService.insertSelective(user);
		ModelAndView mv =new ModelAndView("redirect:/admin/user/list.do");
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
			userService.deleteById(id);
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
			userService.remove(id);
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
		ModelAndView mv =new ModelAndView("/user/update");
		//mv.addObject("pageBean", userService.get(id));
		return mv;
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("user") User user,
		HttpServletRequest request){
		//userService.update(productType);
		return "redirect:/admin/user/list.do";
	}
	
}
