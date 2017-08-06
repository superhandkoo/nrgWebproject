package com.nrg.controller;


import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

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

import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.service.ISolutionService;
import com.nrg.service.ISolutionTypeService;
import com.nrg.utils.BaseController;
import com.nrg.utils.DateUtil;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/solutionType")
public class AdminSolutionTypeController extends BaseController{
	public final static Logger logger=LoggerFactory.getLogger(AdminSolutionTypeController.class);
	
	
	@Autowired
	private ISolutionTypeService solutionTypeService;

	/**
	 * Described 分页列表
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Model model,Integer pageNo,Integer pageSize,@ModelAttribute("solutionType") SolutionType solutionType){
		ModelAndView mv =new ModelAndView("/solution/typeList");
		logger.info("进入解决方案类型的分页列表");
		logger.info(solutionType.getTypeName());
		mv.addObject("pageBean", solutionTypeService.getList(solutionType,pageNo,pageSize));
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public ModelAndView add(Model model){
		ModelAndView mv =new ModelAndView("/solution/typeAdd");
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView adds(Model model,@ModelAttribute("solutionType") SolutionType solutionType,
		HttpServletRequest request){
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		solutionType.setCreatedBy(Integer.valueOf(userId));
		solutionType.setCreatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		solutionTypeService.insertSelective(solutionType);
		ModelAndView mv =new ModelAndView("redirect:/admin/solutionType/list.do");
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
			solutionTypeService.deleteById(id);
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
			solutionTypeService.remove(id);
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
		ModelAndView mv =new ModelAndView("/solution/updateType");
		mv.addObject("pageBean", solutionTypeService.get(id));
		return mv;
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("solutionType") SolutionType solutionType,
		HttpServletRequest request){
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		solutionType.setUpdatedBy(Integer.valueOf(userId));
		solutionType.setUpdatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		solutionTypeService.update(solutionType);
		return "redirect:/admin/solutionType/list.do";
	}
}
