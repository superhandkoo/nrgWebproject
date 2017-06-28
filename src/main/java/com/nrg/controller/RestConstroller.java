package com.nrg.controller;  
  
import org.springframework.stereotype.Controller;  
import org.springframework.ui.ModelMap;  
import org.springframework.web.bind.annotation.PathVariable;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;  
  



@Controller  
public class RestConstroller {  
	//private  BannerImageService bannerImageservcie;
    public RestConstroller() {}  
    /*@RequestMapping(value = "/login/{user}", method = RequestMethod.GET)  
    public ModelAndviews myMethod(HttpServletRequest request,HttpServletResponse response,   
            @PathVariable("user") String user, ModelMap modelMap) throws Exception {  
        modelMap.put("loginUser", user);  
        return new ModelAndviews("/login/hello", modelMap);  
    }  */
    @RequestMapping(value = "/welcome", method = RequestMethod.GET)  
    public String registPost() {  
    	
        return "/welcome";  
    }
    
  
    @RequestMapping(value = "/information", method = RequestMethod.GET)  
    public String information() {  
    	
        return "/information";  
    }
    @RequestMapping(value = "/case", method = RequestMethod.GET)  
    public String Case() {  
    	
        return "/case";  
    }
    @RequestMapping(value = "/about", method = RequestMethod.GET)  
    public String about() {  
    	
        return "/about";  
    }
    
    @RequestMapping(value = "/my-profile", method = RequestMethod.GET)  
    public String myProfile() {  
    	
        return "/adminlogin/my-profile";  
    }
    @RequestMapping(value = "/admin", method = RequestMethod.GET)  
    public String admin() {  
    	
        return "/adminlogin/index";  
    } 
    public String newUser() {  
    	
        return "/adminlogin/new-user";  
    }
    @RequestMapping(value = "/stats", method = RequestMethod.GET)  
    public String stats() {  
    	
        return "/adminlogin/stats";  
    }
    @RequestMapping(value = "/user-stats", method = RequestMethod.GET)  
    public String userstats() {  
    	
        return "/adminlogin/user-stats";  
    }
    @RequestMapping(value = "/users", method = RequestMethod.GET)  
    public String users() {  
    	
        return "/adminlogin/users";  
    }
    @RequestMapping(value = "/new-role", method = RequestMethod.GET)  
    public String newrole() {  
    	
        return "/adminlogin/new-role";  
    }
    @RequestMapping(value = "/roles", method = RequestMethod.GET)  
    public String roles() {  
    	
        return "/adminlogin/roles";  
    }
    @RequestMapping(value = "/visitor-stats", method = RequestMethod.GET)  
    public String visitorstats() {  
    	
        return "/adminlogin/visitor-stats";  
    }
}