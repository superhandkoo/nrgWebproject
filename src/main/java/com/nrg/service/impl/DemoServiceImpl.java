package com.nrg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.nrg.dao.DaoFactory;
import com.nrg.service.IDemoService;
import com.nrg.utils.BeanUtil;
import com.nrg.utils.PagedResult;
import com.nrg.vo.Images;

/**
 * 测试的服务层
 * @author cp
 *
 */
@Service
public class DemoServiceImpl implements IDemoService{
    
	@Resource
	private DaoFactory daoFactory;

	/**
	 * 分页查询
	 */
	@Override
	public PagedResult<Images> queryAllImage(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(daoFactory.getImagesMapper().selectAllImages()); 
	} 
	
	 

}
