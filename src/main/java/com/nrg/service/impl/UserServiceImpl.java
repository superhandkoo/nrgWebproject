package com.nrg.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nrg.dao.DaoFactory;
import com.nrg.service.IUserService;
import com.nrg.vo.User;

@Service
public class UserServiceImpl implements IUserService{
	
	@Resource
	private DaoFactory daoFactory;
	
	public Boolean checkLoginUser(User user) {
		Boolean flag=false;
		int count=daoFactory.getUserMapper().getUserCount(user);
		if(count>0){
			flag=true;
		}
		return flag;
	}

}
