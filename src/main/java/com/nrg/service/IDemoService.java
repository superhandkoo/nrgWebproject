package com.nrg.service;
 

import java.util.List;

import com.nrg.utils.PagedResult;
import com.nrg.vo.Images;

public interface IDemoService {
	// (分页)查询所有的图片
	PagedResult<Images> queryAllImage(Integer page,Integer size);
	//前台图片种类
	public List<Images> kindAllImages(String  typeId);
	
}
