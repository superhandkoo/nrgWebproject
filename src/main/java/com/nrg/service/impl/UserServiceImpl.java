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

	public Boolean checkUserName(String userName) {
		User user=new User();
		user.setName(userName);
		Boolean flag=false;
		int count=daoFactory.getUserMapper().getUserCount(user);
		if(count>0){
			flag=true;
		}
		return flag;
	}

	public Boolean checkMobile(String mobile) {
		User user=new User();
		user.setMobile(mobile);
		Boolean flag=false;
		int count=daoFactory.getUserMapper().getUserCount(user);
		if(count>0){
			flag=true;
		}
		return flag;
	}

	public int createUser(User user) {
		// TODO Auto-generated method stub
		return daoFactory.getUserMapper().insert(user);
	}

}
