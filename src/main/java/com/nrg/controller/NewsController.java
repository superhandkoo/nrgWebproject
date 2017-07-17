package com.nrg.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

}
