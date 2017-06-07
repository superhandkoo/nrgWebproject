package com.nrg.dao;

import com.nrg.vo.Aboutus;

public interface AboutusMapper {
    int deleteByPrimaryKey(Integer aboutusId);

    int insert(Aboutus record);

    int insertSelective(Aboutus record);

    Aboutus selectByPrimaryKey(Integer aboutusId);

    int updateByPrimaryKeySelective(Aboutus record);

    int updateByPrimaryKeyWithBLOBs(Aboutus record);

    int updateByPrimaryKey(Aboutus record);
}