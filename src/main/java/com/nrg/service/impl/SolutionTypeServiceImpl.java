package com.nrg.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;









import com.github.pagehelper.PageHelper;
import com.nrg.dao.NewsMapper;
import com.nrg.dao.SolutionTypeMapper;
import com.nrg.entity.SolutionType;
import com.nrg.service.ISolutionTypeService;
import com.nrg.utils.BeanUtil;
import com.nrg.utils.PagedResult;

@SuppressWarnings("unchecked")
@Service
public class SolutionTypeServiceImpl extends BaseServiceImpl<SolutionType> implements ISolutionTypeService{


	@Autowired
	private SolutionTypeMapper solutionTypeMapper;
	
	@Override
	public PagedResult<SolutionType> getList(SolutionType solutionType,
			Integer pageNo, Integer pageSize) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(solutionTypeMapper.findList(solutionType)); 
	}

	
	

}
