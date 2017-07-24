package com.nrg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.nrg.dao.NewsMapper;
import com.nrg.entity.News;
import com.nrg.service.NewsService;
import com.nrg.utils.BeanUtil;
import com.nrg.utils.PagedResult;

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

	@Override
	public PagedResult<News> findNewsByPage(Integer pageNo, Integer pageSize,
			String condition) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(newsMapper.selectAllNewsByPage(condition));
	}

	@Override
	public int updateNews(News news) {
		return newsMapper.updateNews(news);
	}
	
	
}
