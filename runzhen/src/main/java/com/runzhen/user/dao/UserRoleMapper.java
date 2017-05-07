package com.runzhen.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.runzhen.user.domain.UserRole;

@Repository
public interface UserRoleMapper {
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
    
    void batchInsertUserRole(List<UserRole> userRoleList);
    
    void batchDeleteUserRole(List<UserRole> userRoleList);
}