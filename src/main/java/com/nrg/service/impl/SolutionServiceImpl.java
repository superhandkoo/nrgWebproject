package com.nrg.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nrg.dao.DaoFactory;
import com.nrg.service.ISolutionService;
import com.nrg.service.IUserService;
import com.nrg.vo.User;

@Service
public class SolutionServiceImpl implements ISolutionService{
	
	@Resource
	private DaoFactory daoFactory;

}
