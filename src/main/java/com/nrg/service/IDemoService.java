package com.nrg.service;
 

import com.nrg.utils.PagedResult;
import com.nrg.vo.Images;

public interface IDemoService {
	// (分页)查询所有的图片
	PagedResult<Images> queryAllImage(Integer page,Integer size);
}
