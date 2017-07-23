package com.nrg.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.nrg.service.ServiceFactory;
import com.nrg.vo.Images;

import sun.misc.BASE64Decoder;














@Controller
@Scope(value="prototype")//
@RequestMapping("/admin")
public class bannerImagecontroller {

	/**
	* service的factory类
	*/
	@Autowired
	private ServiceFactory serviceFactory;
	@InitBinder("images")
	public void initBinderQueryCourse(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("images.");
	}
	
	
	 public bannerImagecontroller() {} 
	 @RequestMapping(value = "/index", method = RequestMethod.GET)  
	    public String adminIndex(Model model) {
		    return "/adminlogin/index";  
	    }
	  
	  @RequestMapping(value = "/BannerList", method = RequestMethod.GET)  
	  public ModelAndView getAllimages(Model model,Integer pageNo,Integer pageSize){
			model.addAttribute("pageBean", serviceFactory.getBannerService().queryAllImage(pageNo, pageSize));
			//ModelAndView modelview=new ModelAndView();
			//modelview.setViewName("demo");
			System.out.println("demo例子");
			
			return new ModelAndView("/adminlogin/IndexImgList");
		}
	  /**
	   * 
	   * @param model
	   * @param pageNo
	   * @param pageSize
	   * @param images
	   * @param request
	   * @return  条件查询图片
	   */
	  @RequestMapping(value = "/BannerSearch", method = RequestMethod.GET)  
	  public ModelAndView getSerch(Model model,Integer pageNo,Integer pageSize, @ModelAttribute("images") Images images,HttpServletRequest request){
		  
			model.addAttribute("pageBean", serviceFactory.getBannerService().getSerch( images,pageNo, pageSize));
			
		
			return new ModelAndView("/adminlogin/IndexImgList");
		}    
	  /*
	   * 更改图片上下架
	   */
	  @RequestMapping(value = "/updatImgStauts", method = RequestMethod.GET)  
	  public void updatImgStauts( HttpServletRequest request,HttpServletResponse response){
			System.out.println("updatImgStauts");
			//System.out.println(images.getTypeId()+"===pageNo=="+pageNo);
		    Images images=new Images();
		    images.setImageId(Integer.parseInt(request.getParameter("imageId")));
		    images.setSeriesNumber(Integer.parseInt(request.getParameter("seriesNumber")));
		    	
        	     System.out.println("images==="+images);
        	     response.setContentType("text/html;charset=utf-8");
 				response.setHeader("Cache-Control", "no-cache");
 				PrintWriter  pw=null;
		   
			try {
				serviceFactory.getBannerService().updatImgStauts(images);
				pw =response.getWriter();
				pw.write("1");
			} catch (Exception e) {
				// TODO: handle exception
				pw.write("0");
			}
			pw.flush();
			pw.close();
		
			  
		}    
	  
	     
	  @RequestMapping(value = "/toBannerupdate", method = RequestMethod.GET)
	  public ModelAndView Bannerupdate(Model model, HttpServletRequest request) { 
		    String  imgId=request.getParameter("imgId");
		    model.addAttribute("imgId", serviceFactory.getBannerService().selectByPrimaryKey(Integer.parseInt(imgId)));
			
	        return new ModelAndView("/adminlogin/update_banner");  
	    }
	  
		
	/*@RequestMapping("/Bannerupdate")
		public String add(BannerImage banner) throws Exception {
		 //  banner.setDescribe(banner.getDescribe().substring(3, banner.getDescribe().length()-10));
			System.out.println(banner.toString());
			//accountService.addAccount(acc);
			return "redirect:/account/list.shtml";
		}*/
	@RequestMapping("/BannerupdateImage")//编辑，增加图片 的上传图片的方法
	public void addImage(HttpServletRequest request,HttpServletResponse response){
	
		Calendar now = Calendar.getInstance();
		int moth = now.get(Calendar.MONTH) + 1;
		String pt = now.get(Calendar.YEAR) + "-" + moth + "-" + now.get(Calendar.DAY_OF_MONTH) + "";
	
		//System.out.println("file=="+file.toString());
		  // 生成文件名
        String files = new SimpleDateFormat("yyyyMMddHHmmssSSS")
                .format(new Date())
                + (new Random().nextInt(9000) % (9000 - 1000 + 1) + 1000)
                + ".png";
        // 生成文件路径
    	String path1 = "D:\\banner\\" + pt + "\\"+files;// 
    	File dir = new File(path1);
    	  response.setContentType("text/html;charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter  pw=null;
	
		if (!path1.endsWith(File.separator))
			path1 = path1 + File.separator;
		
		
		   String imageFile=request.getParameter("imageName");
		   
				
	
			
		   System.out.println(imageFile.toString());
		   imageFile = imageFile.replaceAll("data:image/jpeg;base64,", ""); 
		   String  base64Photo = imageFile.substring(imageFile.indexOf(",") + 1,
					imageFile.length());
           BASE64Decoder decoder = new BASE64Decoder();
           // Base64解码      
          
           try {
        	   byte[] b = decoder.decodeBuffer(base64Photo);      
             
               if (!dir.getParentFile().exists()) {
            	   dir.getParentFile().mkdirs();
				}
               
                OutputStream imageStream = new FileOutputStream(dir);
                imageStream.write(b);
                imageStream.flush();
                imageStream.close();   
                pw =response.getWriter();
    			pw.write("1,"+dir);
    			pw.flush();
    		   	pw.close();
        } catch (Exception e) { 
        	
        	pw.write("2"+dir);
        }
	
		
	}	
	
	  /**
	   * 
	   * @param model
	   * @param pageNo
	   * @param pageSize
	   * @param images
	   * @param request
	   * @return  编辑图片方法
	   */
	  @RequestMapping(value = "/updateImg", method = RequestMethod.POST)  
	  public ModelAndView updateImg(Model model,Integer pageNo,Integer pageSize, @ModelAttribute("images") Images images,HttpServletRequest request){
		    System.out.println(images.toString());
			model.addAttribute("msg", serviceFactory.getBannerService().updateByPrimaryKey(images));
			
			model.addAttribute("pageBean", serviceFactory.getBannerService().queryAllImage(pageNo, pageSize));
			
			return new ModelAndView("/adminlogin/IndexImgList");
		}   
	  /**
	   * 
	   * @param model
	   * @param pageNo
	   * @param pageSize
	   * @param images
	   * @param request
	   * @return  前往增加图片页面
	   */
	  @RequestMapping(value = "/toAddImg" , method = RequestMethod.GET)  
	  public ModelAndView toAddImg(){

			
			return new ModelAndView("/adminlogin/add_banner");
		}  
	  /**
	   * 
	   * @param model
	   * @param pageNo
	   * @param pageSize
	   * @param images
	   * @param request
	   * @return  增加图片方法
	   */
	  @RequestMapping(value = "/AddImg")  
	  public ModelAndView AddImg(Model model,Integer pageNo,Integer pageSize, @ModelAttribute("images") Images images,HttpServletRequest request){
		    System.out.println(images.toString());
			model.addAttribute("msg", serviceFactory.getBannerService().insert(images));
			
			model.addAttribute("pageBean", serviceFactory.getBannerService().queryAllImage(pageNo, pageSize));
			
			return new ModelAndView("/adminlogin/IndexImgList");
		}    
	   
    

}
