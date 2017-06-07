package com.nrg.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

/**
 * dao的工厂类
 * 
 * @author cp
 *
 */
@Repository
public class DaoFactory {

	@Resource
	private AboutusMapper aboutusMapper;

	@Resource
	private ChatMapper chatMapper;

	@Resource
	private ImagesMapper imagesMapper;

	@Resource
	private ImageTypeMapper imageTypeMapper;

	@Resource
	private LeaveMsgMapper leaveMsgMapper;

	@Resource
	private MyTestMapper myTestMapper;

	@Resource
	private NewsMapper newsMapper;

	@Resource
	private OnlineMapper onlineMapper;

	@Resource
	private ProductMapper productMapper;

	@Resource
	private SolutionMapper solutionMapper;

	@Resource
	private UserMapper userMapper;

	public AboutusMapper getAboutusMapper() {
		return aboutusMapper;
	}

	public void setAboutusMapper(AboutusMapper aboutusMapper) {
		this.aboutusMapper = aboutusMapper;
	}

	public ChatMapper getChatMapper() {
		return chatMapper;
	}

	public void setChatMapper(ChatMapper chatMapper) {
		this.chatMapper = chatMapper;
	}

	public ImagesMapper getImagesMapper() {
		return imagesMapper;
	}

	public void setImagesMapper(ImagesMapper imagesMapper) {
		this.imagesMapper = imagesMapper;
	}

	public ImageTypeMapper getImageTypeMapper() {
		return imageTypeMapper;
	}

	public void setImageTypeMapper(ImageTypeMapper imageTypeMapper) {
		this.imageTypeMapper = imageTypeMapper;
	}

	public LeaveMsgMapper getLeaveMsgMapper() {
		return leaveMsgMapper;
	}

	public void setLeaveMsgMapper(LeaveMsgMapper leaveMsgMapper) {
		this.leaveMsgMapper = leaveMsgMapper;
	}

	public MyTestMapper getMyTestMapper() {
		return myTestMapper;
	}

	public void setMyTestMapper(MyTestMapper myTestMapper) {
		this.myTestMapper = myTestMapper;
	}

	public NewsMapper getNewsMapper() {
		return newsMapper;
	}

	public void setNewsMapper(NewsMapper newsMapper) {
		this.newsMapper = newsMapper;
	}

	public OnlineMapper getOnlineMapper() {
		return onlineMapper;
	}

	public void setOnlineMapper(OnlineMapper onlineMapper) {
		this.onlineMapper = onlineMapper;
	}

	public ProductMapper getProductMapper() {
		return productMapper;
	}

	public void setProductMapper(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}

	public SolutionMapper getSolutionMapper() {
		return solutionMapper;
	}

	public void setSolutionMapper(SolutionMapper solutionMapper) {
		this.solutionMapper = solutionMapper;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

}
