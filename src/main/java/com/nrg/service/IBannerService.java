package com.nrg.service;
 

import java.util.List;

import com.nrg.utils.PagedResult;
import com.nrg.vo.Images;

public interface IBannerService {
	// (分页)查询所有的图片
	PagedResult<Images> queryAllImage(Integer page,Integer size);
	//前台图片种类
	public List<Images> kindAllImages(String  typeId);
	//后台条件查询
	public PagedResult<Images> getSerch( Images  images,Integer pageNo,Integer pageSize);
	void updatImgStauts(Images images);
	public Images selectByPrimaryKey(Integer imageId);
	public int updateByPrimaryKey	(Images  images);
	public int updateByPrimaryKeySelective	(Images  images);
	public int insert(Images  images);
}
