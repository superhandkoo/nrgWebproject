package com.nrg.service;

import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.utils.PagedResult;


public interface ISolutionService extends IBaseService<Solution> {

	PagedResult<Solution> getList(Solution solution, Integer pageNo, Integer pageSize);
	
}
