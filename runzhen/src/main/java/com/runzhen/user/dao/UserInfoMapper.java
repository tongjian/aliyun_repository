package com.runzhen.user.dao;

import org.springframework.stereotype.Repository;

import com.runzhen.user.domain.UserInfo;

@Repository
public interface UserInfoMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
}