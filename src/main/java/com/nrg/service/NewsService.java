package com.nrg.service;

import java.util.List;
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
	
	/**
	 * 分页 条件查询 新闻信息。
	 * @param pageNo 当前页码
	 * @param pageSize 每页记录数
	 * @param condition 查询条件
	 * @return
	 */
	public List<News> findNewsByPage(Integer pageNo, Integer pageSize,String condition); // PagedResult<News> 
	
	/**
	 * 修改 新闻信息
	 * @param news
	 * @return
	 */
	int updateNews(News news);
}
