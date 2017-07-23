package com.nrg.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.InitBinder;

import com.github.pagehelper.PageHelper;
import com.nrg.dao.DaoFactory;
import com.nrg.service.IBannerService;
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
public class BannerServiceImpl implements  IBannerService {
    
	@Resource
	private DaoFactory daoFactory;
	
	

	/**
	 * 分页查询
	 */
	public PagedResult<Images> queryAllImage(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(daoFactory.getImagesMapper().selectAllImages()); 
	} 
	
	/**
	 * bannner查询  type id=1 bannner
	 */
	public List<Images> kindAllImages(String  typeId) {
		
		 return daoFactory.getImagesMapper().kindAllImages(typeId); 
	} 
	
	/**
	 * 后台bannner查询 
	 */
	public PagedResult<Images> getSerch( Images  images,Integer pageNo,Integer pageSize) {
		
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 5 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		Map<String, Object>  map=new HashMap<String, Object>();
		map.put("typeId",images.getTypeId() );
		map.put("seriesNumber", images.getSeriesNumber());
		System.out.println("");
		return BeanUtil.topagedResult( daoFactory.getImagesMapper().getSerch( images)); 
	} 
	/**
	 * 后台bannner查询 
	 */
	public void updatImgStauts(Images  images){
		
		daoFactory.getImagesMapper().updatImgStauts(images);
		
	}

	public Images selectByPrimaryKey(Integer imageId) {
		// TODO Auto-generated method stub
		return daoFactory.getImagesMapper().selectByPrimaryKey(imageId);
	}
		
	public int updateByPrimaryKey(Images  images){
		return daoFactory.getImagesMapper().updateByPrimaryKey(images);
	}
	public int updateByPrimaryKeySelective(Images  images){
	return daoFactory.getImagesMapper().updateByPrimaryKeySelective(images);
	}
	public int insert(Images  images){
		return daoFactory.getImagesMapper().insert(images);
		
		}
}
