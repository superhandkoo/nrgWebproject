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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nrg.entity.Product;
import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.service.ISolutionService;
import com.nrg.service.ISolutionTypeService;
import com.nrg.service.ServiceFactory;
import com.nrg.utils.BaseController;
import com.nrg.utils.DateUtil;
import com.nrg.vo.User;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/solution")
public class AdminSolutionController extends BaseController{
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
		ModelAndView mv =new ModelAndView("/solution/add");
		return mv;
	}
	
	@RequestMapping(value = "/add",method = RequestMethod.POST)
	public ModelAndView adds(Model model,@ModelAttribute("solution") Solution solution,
		HttpServletRequest request){
		
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		solution.setCreatedBy(Integer.valueOf(userId));
		solution.setCreatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		solutionService.insertSelective(solution);
		
		ModelAndView mv =new ModelAndView("redirect:/admin/solution/list.do");
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
			solutionService.deleteById(id);
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
		logger.info(""+id);
		String code = "success";
		try {
			solutionService.remove(id);
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
		ModelAndView mv =new ModelAndView("/solution/update");
		mv.addObject("pageBean", solutionService.get(id));
		return mv;
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping(value = "/update",method = RequestMethod.POST)
	public String updateadd(@ModelAttribute("solution") Solution solution,
		HttpServletRequest request){
		String userId=String.valueOf(request.getSession().getAttribute("userId"));
		solution.setUpdatedBy(Integer.valueOf(userId));
		solution.setUpdatedOn(DateUtil.currTime());// new Date()为获取当前系统时间);
		solutionService.update(solution);
		return "redirect:/admin/solution/list.do";
	}
}
