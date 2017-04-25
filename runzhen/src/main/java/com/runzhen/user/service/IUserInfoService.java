package com.runzhen.user.service;

import java.util.List;

import com.runzhen.user.domain.UserInfo;

public interface IUserInfoService {
	
	int deleteByPrimaryKey(Integer userId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
    
    List<UserInfo> findByInfo(UserInfo record);
    
    List<UserInfo> selectByPage(UserInfo record);
    
    Integer getTotal(UserInfo record);
}
