package com.runzhen.user.service;

import java.util.List;

import com.runzhen.user.domain.RoleInfo;

public interface IRoleInfoService {
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
