package com.nrg.service;

import com.nrg.entity.Product;
import com.nrg.utils.PagedResult;
import com.nrg.vo.User;

public interface IUserService {
	/**
	 * 后台user登录检测
	 * @param user
	 * @return
	 */
	public Boolean checkLoginUser(User user);
	
	public User getUserInfoByLogin(String name,String password);
	/**
	 * 用户名唯一性检测
	 * @param userName
	 * @return
	 */
	public Boolean checkUserName(String userName);
	/**
	 * 手机号唯一性检测
	 * @param mobile
	 * @return
	 */
	public Boolean checkMobile(String mobile);
	
	public int createUser(User user);

	public PagedResult<Product> getList(User user, Integer pageNo, Integer pageSize);

	public int insertSelective(User user);

	public int deleteById(Long id);

	public int remove(Long id);
}
