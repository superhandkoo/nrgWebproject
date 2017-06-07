package com.nrg.dao;

import com.nrg.vo.ImageType;

public interface ImageTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(ImageType record);

    int insertSelective(ImageType record);

    ImageType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(ImageType record);

    int updateByPrimaryKey(ImageType record);
}