package com.nrg.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import com.github.pagehelper.PageHelper;
import com.nrg.dao.ProductTypeMapper;
import com.nrg.dao.SolutionTypeMapper;
import com.nrg.entity.ProductType;
import com.nrg.entity.SolutionType;
import com.nrg.service.IProductTypeService;
import com.nrg.utils.BeanUtil;
import com.nrg.utils.PagedResult;

@SuppressWarnings("unchecked")
@Service
public class ProductTypeServiceImpl extends BaseServiceImpl<ProductType> implements IProductTypeService{
	
	@Autowired
	private ProductTypeMapper productTypeMapper;
	
	@Override
	public PagedResult<ProductType> getList(ProductType productType,
			Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(productTypeMapper.findList(productType)); 
	}
}
