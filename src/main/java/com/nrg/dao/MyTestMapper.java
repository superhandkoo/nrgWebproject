package com.nrg.dao;

import com.nrg.vo.MyTest;

public interface MyTestMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MyTest record);

    int insertSelective(MyTest record);

    MyTest selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MyTest record);

    int updateByPrimaryKey(MyTest record);
}