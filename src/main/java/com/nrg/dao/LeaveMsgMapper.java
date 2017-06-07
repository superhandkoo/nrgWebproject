package com.nrg.dao;

import com.nrg.vo.LeaveMsg;

public interface LeaveMsgMapper {
    int deleteByPrimaryKey(Integer lmId);

    int insert(LeaveMsg record);

    int insertSelective(LeaveMsg record);

    LeaveMsg selectByPrimaryKey(Integer lmId);

    int updateByPrimaryKeySelective(LeaveMsg record);

    int updateByPrimaryKey(LeaveMsg record);
}