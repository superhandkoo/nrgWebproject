package com.nrg.service;

import com.nrg.entity.Product;
import com.nrg.entity.Solution;
import com.nrg.utils.PagedResult;


public interface IProductService  extends IBaseService<Product>{
	PagedResult<Product> getList(Product product, Integer pageNo, Integer pageSize);
}
