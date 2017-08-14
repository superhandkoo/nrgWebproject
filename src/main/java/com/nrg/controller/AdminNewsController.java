package com.nrg.controller;

import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.nrg.entity.News;
import com.nrg.service.NewsService;
import com.nrg.service.ServiceFactory;
import com.nrg.utils.BaseController;

@Controller
@Scope(value="prototype")
@RequestMapping("/admin/news")
public class AdminNewsController extends BaseController {
	private static Logger logger = LoggerFactory.getLogger(AdminNewsController.class);
	
	/**
	 * service的factory类
	 */
	@Autowired
	private ServiceFactory serviceFactory;
	
	@Autowired
	private NewsService newsService;
	
	/**
	 * Described 分页列表
	 * @return
	 */
	@RequestMapping("/list")
	public String list(Model model,Integer pageNo, Integer pageSize,String condition){
		List<News> list = newsService.findNewsByPage(pageNo, pageSize, condition);
		logger.info("获取的值：{}",list);
		PageInfo<News> page = new PageInfo<News>(list);
		model.addAttribute("page", page);
		model.addAttribute("userId", page);
		return "/news/list";
	}
	
	/**
	 * Described 添加banner
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public Object add(News news){
		news.setIsDel(0);
		news.setCreateTime(new Date());
		int index = newsService.addNews(news);
		logger.info("添加的新闻对象内容：{}",news);
		if(index>0){
			logger.info("新闻信息 添加成功！");
			return responseSuccess("添加成功");
		}else{
			return responseFail("添加失败");
		}
	}
	
	/**
	 * 添加新闻信息
	 * @return
	 */
	@RequestMapping(value="toAdd", method = RequestMethod.GET)
	public String toAdd(){
		logger.info("进入新闻添加页面");
		return "news/add";
	}
	
	/**
	 * 逻辑删除新闻信息。
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
    public String delete(Long id) {
		News news = new News();
		news.setId(id);
		news.setIsDel(1); // 逻辑删除。isdel->1:删除。
		int index = newsService.updateNews(news);
		if(index>0){
			logger.info("逻辑删除成功！");
		} else{
			logger.info("逻辑删除失败！");
		}
		return "redirect:/admin/news/list.do";
	}
	
	/**
	 * Described跳转到修改
	 * @return
	 */
	@RequestMapping("/update")
	public String update(Model model,Long id){
		logger.info("根据ID：{}，查询新闻信息。",id);
		News news = newsService.findNewsById(id);
		model.addAttribute("news", news);
		return "/news/update";
	}
	
	/**
	 * Described修改完成
	 * @return
	 */
	@RequestMapping("/updateadd")
	@ResponseBody
	public Object updateadd(News news, Long id){
		news.setId(id);
		int index = newsService.updateNews(news);
		if (index > 0) {
			logger.info("新闻信息 修改成功！");
			return responseSuccess("修改成功！");
        } else {
        	logger.info("新闻信息 修改失败！");
        	return responseFail("修改失败！");
        }
	}
}
