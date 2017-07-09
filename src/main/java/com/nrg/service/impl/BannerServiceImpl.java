package com.nrg.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nrg.dao.DaoFactory;
import com.nrg.service.IBannerService;
import com.nrg.service.IUserService;
import com.nrg.vo.User;

@Service
public class BannerServiceImpl implements IBannerService{
	
	@Resource
	private DaoFactory daoFactory;
	
}
