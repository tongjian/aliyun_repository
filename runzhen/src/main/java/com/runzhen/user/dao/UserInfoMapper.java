package com.runzhen.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.runzhen.user.domain.UserInfo;

@Repository
public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userId);
    
    List<UserInfo> findByInfo(UserInfo record);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}