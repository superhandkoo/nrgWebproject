package com.nrg.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.nrg.dao.ProductMapper;
import com.nrg.dao.SolutionMapper;
import com.nrg.entity.Product;
import com.nrg.entity.Solution;
import com.nrg.service.IProductService;
import com.nrg.utils.BeanUtil;
import com.nrg.utils.PagedResult;

@SuppressWarnings("unchecked")
@Service
public class ProductServiceImpl extends BaseServiceImpl<Product> implements IProductService{
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public PagedResult<Product> getList(Product product,
			Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(productMapper.findList(product)); 
	}
}
