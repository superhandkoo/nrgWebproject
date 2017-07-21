package com.nrg.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nrg.entity.News;

/**
 * 新闻 mapper接口
 * @author: yyy
 */
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
	
	/**
	 * 分页查询 新闻信息
	 * @param condition 条件
	 * @return
	 */
	/*List<News> selectAllNewsByPage(@Param("condition")String condition);*/
	
/*    int deleteByPrimaryKey(Integer newsId);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer newsId);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);*/
}