package com.nrg.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;






import com.github.pagehelper.PageHelper;
import com.nrg.dao.SolutionMapper;
import com.nrg.dao.SolutionTypeMapper;
import com.nrg.entity.Solution;
import com.nrg.entity.SolutionType;
import com.nrg.service.ISolutionService;
import com.nrg.utils.BeanUtil;
import com.nrg.utils.PagedResult;

@SuppressWarnings("unchecked")
@Service
public class SolutionServiceImpl extends BaseServiceImpl<Solution> implements ISolutionService{
	@Autowired
	private SolutionMapper solutionMapper;
	
	@Override
	public PagedResult<Solution> getList(Solution solution,
			Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(solutionMapper.findList(solution)); 
	}

	

}
