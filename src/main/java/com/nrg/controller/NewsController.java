package com.nrg.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.nrg.entity.News;
import com.nrg.service.NewsService;
import com.nrg.utils.BaseController;

/**
 * 新闻管理
 * <p>Title: NewsController </p> 
 * <p>Description: </p> 
 * <p>Company: www.nrg.com</p>
 * @author: yyy
 * @createtime: 2017年7月15日 下午11:58:32
 * @version 1.0
 */
@Controller
@RequestMapping("/news")
public class NewsController extends BaseController {
	
	private static Logger logger = LoggerFactory.getLogger(NewsController.class);
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value="toAdd", method = RequestMethod.GET)
	public String toAdd(){
		logger.info("进入新闻添加页面");
		return "news/add";
	}
	
	/**
	 * 添加新闻信息。
	 * @param news
	 * @return
	 */
	@RequestMapping(value = "/add")
	@ResponseBody
	public Object addNews(News news){
		int index = newsService.addNews(news);
		if(index>0){
			logger.info("新闻信息 添加成功！");
			return responseSuccess("添加成功");
		}
		return responseFail("添加失败");
	}
	
	/**
	 * 新闻 分页查询、条件查询分页。
	 * @param model
	 * @param pageNo
	 * @param pageSize
	 * @param condition
	 * @return
	 */
	@RequestMapping(value = "/getAllNewsBypage")
	public Object getAllNewsBypage(Model model,Integer pageNo, Integer pageSize,String condition){
		List<News> list = newsService.findNewsByPage(pageNo, pageSize, condition);
		logger.info("获取的值：{}",list);
		PageInfo<News> page = new PageInfo<News>(list);
		model.addAttribute("page", page);
		return "news/list";
	}
	
	/**
	 * 根据id 修改新闻信息。
	 * @param news
	 * @param id
	 * @return
	 */
	@RequestMapping("/update")
    @ResponseBody
    public Object update(News news, Long id){
		news.setId(id);
		int index = newsService.updateNews(news);
		if (index > 0) {
            return responseSuccess("修改成功！");
        } else {
            return responseFail("修改失败！");
        }
	}
	
	/**
	 * 逻辑删除新闻信息。
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
		News news = new News();
		news.setId(id);
		news.setIsDel(1); // 逻辑删除。isdel->1:删除。
		int index = newsService.updateNews(news);
		if (index > 0) {
            return responseSuccess("删除成功！");
        } else {
            return responseFail("删除失败！");
        }
	}

}
