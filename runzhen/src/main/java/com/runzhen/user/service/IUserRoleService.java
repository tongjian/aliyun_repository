package com.runzhen.user.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.runzhen.user.domain.UserInfo;
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
    
    List<UserRole> findByInfo(UserRole record);
    
    List<Integer> findRoleIdsByInfo(UserRole record);
    
	String changeUserRoleReleative(UserInfo userInfo,Integer[] roleIds, HttpSession httpSession);
	
	void batchInsertUserRole(List<UserRole> userRoleList);
	
	void batchDeleteUserRole(List<UserRole> userRoleList);
}
