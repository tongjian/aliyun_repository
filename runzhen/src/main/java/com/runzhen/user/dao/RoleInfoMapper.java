package com.runzhen.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.runzhen.user.domain.RoleInfo;

@Repository
public interface RoleInfoMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(RoleInfo record);

    int insertSelective(RoleInfo record);

    RoleInfo selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(RoleInfo record);

    int updateByPrimaryKey(RoleInfo record);
    
    List<RoleInfo> selectByPage(RoleInfo record);
    
    Integer getTotal(RoleInfo record);
    
    List<RoleInfo> findByInfo(RoleInfo record);
}