package com.nrg.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

public class RequestFilter implements Filter{
	private String excludedPages;
	private String[] excludedPageArray;
	@Override
	public void destroy() {
		return;
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		boolean isExcludedPage = false;
		System.out.println(((HttpServletRequest) request).getServletPath());
		for (String page : excludedPageArray) {//判断是否在过滤url之外    
			if(((HttpServletRequest) request).getServletPath().equals(page)){  
				isExcludedPage = true;     
				break;     
			}     
		}   
		if(isExcludedPage){
			chain.doFilter(request, response);
		}else{
			//在这里判断session是否已失效，如已失效则重定向到登录页面。  
			HttpServletRequest req = (HttpServletRequest)request;
			HttpServletResponse resp=(HttpServletResponse)response;
			String userId=String.valueOf(req.getSession().getAttribute("userId"));
			//如果是css/js/图片
			StringBuffer url=req.getRequestURL();
			if(url.toString().contains(".css")||url.toString().contains(".js")||url.toString().contains(".png")||url.toString().contains(".jpg")||url.toString().contains(".jpeg")){
				chain.doFilter(request, response);
			}else{
				if(StringUtils.equals(userId, "null")){
					//失效返回登录页面
					resp.sendRedirect(req.getContextPath()+"/admin/loginWeb.do");  
					return;
				}else{
					chain.doFilter(request, response);
				}
			}
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		//登录排除在外
		excludedPages=filterConfig.getInitParameter("excludedLogin");
		if (StringUtils.isNotEmpty(excludedPages)) {     
			excludedPageArray = excludedPages.split(",");     
		}     
		return;  
		
	}

}
