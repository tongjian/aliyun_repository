package com.runzhen.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runzhen.user.dao.RoleInfoMapper;
import com.runzhen.user.domain.RoleInfo;
import com.runzhen.user.service.IRoleInfoService;

@Service("roleInfoService") 
public class RoleInfoServiceImpl implements IRoleInfoService {

	@Autowired
	private RoleInfoMapper roleInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer roleId) {
		// TODO Auto-generated method stub
		return roleInfoMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public int insert(RoleInfo record) {
		// TODO Auto-generated method stub
		return roleInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(RoleInfo record) {
		// TODO Auto-generated method stub
		return roleInfoMapper.insertSelective(record);
	}

	@Override
	public RoleInfo selectByPrimaryKey(Integer roleId) {
		// TODO Auto-generated method stub
		return roleInfoMapper.selectByPrimaryKey(roleId);
	}

	@Override
	public int updateByPrimaryKeySelective(RoleInfo record) {
		// TODO Auto-generated method stub
		return roleInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(RoleInfo record) {
		// TODO Auto-generated method stub
		return roleInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<RoleInfo> selectByPage(RoleInfo record) {
		// TODO Auto-generated method stub
		return roleInfoMapper.selectByPage(record);
	}

	@Override
	public Integer getTotal(RoleInfo record) {
		// TODO Auto-generated method stub
		return roleInfoMapper.getTotal(record);
	}

}
