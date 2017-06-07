package com.nrg.dao;

import com.nrg.vo.Online;

public interface OnlineMapper {
    int deleteByPrimaryKey(Integer onlineId);

    int insert(Online record);

    int insertSelective(Online record);

    Online selectByPrimaryKey(Integer onlineId);

    int updateByPrimaryKeySelective(Online record);

    int updateByPrimaryKey(Online record);
}