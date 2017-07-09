package com.nrg.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nrg.service.ServiceFactory;
@Controller
@Scope(value="prototype")
@RequestMapping("/admin/about")
public class AdminAboutController {
	
	/**
	 * service的factory类
	 */
	@Autowired
	private ServiceFactory serviceFactory;
	
	/**
	 * 走进瑞兰德
	 * @return
	 */
	@RequestMapping("/goNRG")
	public String goNRG(){
		return "/about/goNRG";
	}
	
	@RequestMapping("/goNRGUpdate")
	public String goNRGUpdate(){
		return "/about/goNRGUpdate";
	}
	
    /**
     * 营销网络    
     * @return
     */
    @RequestMapping("/marketing")
    public String marketing(){
    	return "/about/marketing";
    }
    
    @RequestMapping("/marketingUpdate")
    public String marketingUpdate(){
    	return "/about/marketingUpdate";
    }
    
    /**
     * 加入我们
     * @return
     */
    @RequestMapping("/joinUs")
	public String joinUs(){
		return "/about/joinUs";
	}
    
    @RequestMapping("/joinUsUpdate")
	public String joinUsUpdate(){
		return "/about/joinUsUpdate";
	}
    
    /**
     * 联系我们
     * @return
     */
    @RequestMapping("/contactUs")
	public String contactUs(){
		return "/about/contactUs";
	}
    
    @RequestMapping("/contactUsUpdate")
	public String contactUsUpdate(){
		return "/about/contactUsUpdate";
	}
}
