package com.nrg.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * service 的工厂类
 * 
 * @author cp
 *
 */
@Service
public class ServiceFactory {

	@Resource
	private IDemoService demoService;
	@Resource
	private IUserService userService;
	
	
	public IDemoService getDemoService() {
		return demoService;
	}

	public void setDemoService(IDemoService demoService) {
		this.demoService = demoService;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	
}
