package com.nrg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nrg.dao.NewsMapper;
import com.nrg.entity.News;
import com.nrg.service.NewsService;

/**
 * todo 新闻服务实现类
 * @author yyy
 *
 */
@Service
public class NewsServiceImpl implements NewsService{
	
	@Autowired
	private NewsMapper newsMapper;

	@Override
	public int addNews(News news) {
		return newsMapper.insert(news);
	}

	@Override
	public News findNewsById(Long id) {
		return newsMapper.selectByPrimaryKey(id);
	}
	
	
}
