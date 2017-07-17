package com.nrg.dao;

import com.nrg.entity.News;

public interface NewsMapper {
	/**
	 * 添加 新闻
	 * @param news
	 * @return
	 */
	int insert(News news);
	
	/**
	 * 根据主键，查询该条新闻记录
	 * @param id
	 * @return
	 */
	News selectByPrimaryKey(Long id);
/*    int deleteByPrimaryKey(Integer newsId);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);*/
}