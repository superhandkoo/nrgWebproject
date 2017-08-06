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

import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.service.ISolutionService;
import com.nrg.service.ISolutionTypeService;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/solutionType")
public class AdminSolutionTypeController {
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
	public ModelAndView adds(Model model,@ModelAttribute("solutionType") SolutionType solutionType){
		solutionTypeService.insertSelective(solutionType);
		ModelAndView mv =new ModelAndView("redirect:/admin/solutionType/list.do");
		return mv;
	}
	
	/**
	 * Described删除
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(Long id){
		solutionTypeService.deleteById(id);
		//return "/solution/delete";
	}
	
	/**
	 * Described跳转到修改
	 * @return
	 */
	@RequestMapping(value ="/update",method = RequestMethod.GET)
	public String update(){
		return "/solution/updateType";
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("solutionType") SolutionType solutionType){
		solutionTypeService.update(solutionType);
		return "redirect:/admin/solutionType/list.do";
	}
}
