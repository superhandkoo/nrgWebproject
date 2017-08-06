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

import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.service.ISolutionService;
import com.nrg.service.ISolutionTypeService;
import com.nrg.service.ServiceFactory;
import com.nrg.vo.User;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/solution")
public class AdminSolutionController {
	public final static Logger logger=LoggerFactory.getLogger(AdminSolutionController.class);
	
	
	@Autowired
	private ISolutionService solutionService;
	
	
	
	@RequestMapping(value = "/list")
	public ModelAndView list(Model model,Integer pageNo,Integer pageSize,@ModelAttribute("solution") Solution solution){
		ModelAndView mv =new ModelAndView("/solution/list");
		logger.info("进入解决方案的分页列表");
		mv.addObject("pageBean", solutionService.getList(solution,pageNo,pageSize));
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public ModelAndView add(Model model){
		ModelAndView mv =new ModelAndView("/solution/Add");
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView adds(Model model,@ModelAttribute("solution") Solution solution){
		solutionService.insertSelective(solution);
		ModelAndView mv =new ModelAndView("redirect:/admin/solution/list.do");
		return mv;
	}
	
	/**
	 * Described删除
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(Long id){
		solutionService.deleteById(id);
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
	public String updateadd(@ModelAttribute("solution") Solution solution){
		solutionService.update(solution);
		return "redirect:/admin/solution/list.do";
	}
}
