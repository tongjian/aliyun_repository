package com.runzhen.user.service;

import java.util.List;

import com.runzhen.user.domain.UserRole;

public interface IUserRoleService {
	int deleteByPrimaryKey(Integer id);

    int insert(UserRole record);

    int insertSelective(UserRole record);

    UserRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserRole record);

    int updateByPrimaryKey(UserRole record);
    
    List<UserRole> selectByPage(UserRole record);
    
    int getTotal(UserRole record);
}
