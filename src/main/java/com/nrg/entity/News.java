package com.nrg.entity;

import java.io.Serializable;
import java.util.Date;

import com.alibaba.fastjson.JSONObject;
//import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 新闻 类型表
 * @author: yyy
 * @createtime: 2017年7月15日 下午10:23:10
 * @version 1.0
 */
public class News implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private Integer type;
	
	private String title;
	
	private String name;
	
	private String introduction;
	
	private String imgUrl;
	
	private String address;
	
	private String htmlContent;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createTime;
	
	private Integer status;
	
	private Integer isDel;
	
	private Integer sort;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHtmlContent() {
		return htmlContent;
	}

	public void setHtmlContent(String htmlContent) {
		this.htmlContent = htmlContent;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsDel() {
		return isDel;
	}

	public void setIsDel(Integer isDel) {
		this.isDel = isDel;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	@Override
	public String toString() {
/*		return "News{" + "id=" + id +",type=" + type + ",title=" + title +", name='" + name + '\'' + ", introduction=" + introduction + ", imgUrl='" + imgUrl
				+ '\'' + ", address=" + address+",htmlContent=" + htmlContent+",createTime=" + createTime+",createTime=" + createTime+",status=" + status+",isDel=" + isDel  + '}';*/
		return "[News:"+JSONObject.toJSONString(this)+"]";
	}

}
