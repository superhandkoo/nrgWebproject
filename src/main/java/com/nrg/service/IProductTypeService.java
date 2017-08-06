package com.nrg.service;

import com.nrg.entity.ProductType;
import com.nrg.entity.SolutionType;
import com.nrg.utils.PagedResult;


public interface IProductTypeService  extends IBaseService<ProductType>{

	PagedResult<ProductType> getList(ProductType productType, Integer pageNo, Integer pageSize);

}
