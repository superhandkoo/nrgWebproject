package com.nrg.service;

import com.nrg.entity.News;

/**
 * todo 新闻服务
 * @author yyy
 * @createtime: 2017年7月15日 下午11:50:03
 */
public interface NewsService {
	/**
	 * 添加新闻
	 * @param news
	 * @return
	 */
	int addNews(News news);
	
	/**
	 * 根据Id，查询新闻信息
	 * @param id
	 * @return
	 */
	News findNewsById(Long id);
}
