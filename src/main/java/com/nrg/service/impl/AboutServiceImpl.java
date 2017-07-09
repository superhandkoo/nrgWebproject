package com.nrg.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nrg.dao.DaoFactory;
import com.nrg.service.IAboutService;

@Service
public class AboutServiceImpl implements IAboutService{
	
	@Resource
	private DaoFactory daoFactory;
	
}
