package com.nrg.dao;

import java.util.List;

import com.nrg.vo.Images;

public interface ImagesMapper {
    int deleteByPrimaryKey(Integer imageId);

    int insert(Images record);

    int insertSelective(Images record);

    Images selectByPrimaryKey(Integer imageId);

    int updateByPrimaryKeySelective(Images record);

    int updateByPrimaryKey(Images images);
    
    List<Images> selectAllImages();
    List<Images> kindAllImages(String typeId);
    List<Images> getSerch(Images images);
    void updatImgStauts(Images  images);
    
  

}