package com.nrg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nrg.entity.Product;
import com.nrg.vo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int getUserCount(User user);
    
    User getUserByLogin(Map<String, Object> map);

	public List<Product> findList(User user);

	public int deleteById(@Param("id")Long id);

	public int remove(@Param("id")Long id);
}