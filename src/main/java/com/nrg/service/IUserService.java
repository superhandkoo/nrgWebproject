package com.nrg.service;

import com.nrg.vo.User;

public interface IUserService {
	/**
	 * 后台user登录检测
	 * @param user
	 * @return
	 */
	public Boolean checkLoginUser(User user);
}
