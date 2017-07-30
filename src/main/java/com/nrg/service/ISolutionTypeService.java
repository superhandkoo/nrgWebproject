package com.nrg.service;

import com.nrg.entity.SolutionType;
import com.nrg.utils.PagedResult;


public interface ISolutionTypeService  extends IBaseService<SolutionType>{

	PagedResult<SolutionType> getList(SolutionType solutionType, Integer pageNo, Integer pageSize);

}
