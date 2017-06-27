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
    	
        return "/views/welcome.jsp";  
    }
    
  
    @RequestMapping(value = "/information", method = RequestMethod.GET)  
    public String information() {  
    	
        return "/views/information.jsp";  
    }
    @RequestMapping(value = "/case", method = RequestMethod.GET)  
    public String Case() {  
    	
        return "/views/case.jsp";  
    }
    @RequestMapping(value = "/about", method = RequestMethod.GET)  
    public String about() {  
    	
        return "/views/about.jsp";  
    }
    
    @RequestMapping(value = "/my-profile", method = RequestMethod.GET)  
    public String myProfile() {  
    	
        return "/views/adminlogin/my-profile.jsp";  
    }
    @RequestMapping(value = "/admin", method = RequestMethod.GET)  
    public String admin() {  
    	
        return "/views/adminlogin/index.jsp";  
    } 
    public String newUser() {  
    	
        return "/views/adminlogin/new-user.jsp";  
    }
    @RequestMapping(value = "/stats", method = RequestMethod.GET)  
    public String stats() {  
    	
        return "/views/adminlogin/stats.jsp";  
    }
    @RequestMapping(value = "/user-stats", method = RequestMethod.GET)  
    public String userstats() {  
    	
        return "/views/adminlogin/user-stats.jsp";  
    }
    @RequestMapping(value = "/users", method = RequestMethod.GET)  
    public String users() {  
    	
        return "/views/adminlogin/users.jsp";  
    }
    @RequestMapping(value = "/new-role", method = RequestMethod.GET)  
    public String newrole() {  
    	
        return "/views/adminlogin/new-role.jsp";  
    }
    @RequestMapping(value = "/roles", method = RequestMethod.GET)  
    public String roles() {  
    	
        return "/views/adminlogin/roles.jsp";  
    }
    @RequestMapping(value = "/visitor-stats", method = RequestMethod.GET)  
    public String visitorstats() {  
    	
        return "/views/adminlogin/visitor-stats.jsp";  
    }
}