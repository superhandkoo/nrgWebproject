package com.nrg.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nrg.utils.BaseController;

@Controller
@Scope(value="prototype")
@RequestMapping("/baidu")
public class BaiduController extends BaseController {
	private static Logger logger = LoggerFactory.getLogger(BaiduController.class);
	
	@RequestMapping(value="/returnImage")
	public String returnImage(Model model,HttpServletRequest request){
		logger.info("---进入图片回显方法---");
		Properties prop = new Properties();
		InputStream in = AdminNewsController.class.getResourceAsStream("/application.properties");
		String newPath="";
		try {
			prop.load(in);
			newPath = prop.getProperty("newPath").trim();
			logger.info("获取配置文件路径：{}",newPath);
		} catch (IOException e) {
			logger.info("获取图片上传路径出错");
			e.printStackTrace();
		}
		request.getSession().setAttribute("impath", newPath);
		return "/news/rtnImage";
	}

}
