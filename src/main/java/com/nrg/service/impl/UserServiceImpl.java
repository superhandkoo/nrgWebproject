package com.nrg.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.nrg.dao.UserMapper;
import com.nrg.entity.Product;
import com.nrg.service.IUserService;
import com.nrg.utils.BeanUtil;
import com.nrg.utils.PagedResult;
import com.nrg.vo.User;

@Service
public class UserServiceImpl implements IUserService{
	
	@Autowired
	private UserMapper userMapper;
	@Override
	public Boolean checkLoginUser(User user) {
		Boolean flag=false;
		int count = userMapper.getUserCount(user);
		if(count>0){
			flag=true;
		}
		return flag;
	}
	@Override
	public Boolean checkUserName(String userName) {
		User user=new User();
		user.setName(userName);
		Boolean flag=false;
		int count = userMapper.getUserCount(user);
		if(count>0){
			flag=true;
		}
		return flag;
	}
	@Override
	public Boolean checkMobile(String mobile) {
		User user=new User();
		user.setMobile(mobile);
		Boolean flag=false;
		int count=userMapper.getUserCount(user);
		if(count>0){
			flag=true;
		}
		return flag;
	}
	@Override
	public int createUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.insert(user);
	}

	@Override
	public User getUserInfoByLogin(String name, String password) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("name", name);
		map.put("password", password);
		return userMapper.getUserByLogin(map);
	}

	@Override
	public PagedResult<Product> getList(User user, Integer pageNo,
			Integer pageSize) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.topagedResult(userMapper.findList(user)); 
	}

	@Override
	public int insertSelective(User user) {
		// TODO Auto-generated method stub
		user.setAddtime(new Date());
		return userMapper.insertSelective(user);
	}

	@Override
	public int deleteById(Long id) {
		// TODO Auto-generated method stub
		return userMapper.deleteById(id);
	}

	@Override
	public int remove(Long id) {
		// TODO Auto-generated method stub
		return userMapper.remove(id);
	}

}
