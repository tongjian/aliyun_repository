package com.runzhen.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.runzhen.user.dao.UserInfoMapper;
import com.runzhen.user.domain.UserInfo;
import com.runzhen.user.service.IUserInfoService;

@Service("userInfoService") 
public class UserInfoServiceImpl implements IUserInfoService {
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public int insert(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.insertSelective(record);
	}

	@Override
	public UserInfo selectByPrimaryKey(Integer userId) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByPrimaryKey(userId);
	}

	@Override
	public int updateByPrimaryKeySelective(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<UserInfo> findByInfo(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.findByInfo(record);
	}

	@Override
	public List<UserInfo> selectByPage(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByPage(record);
	}

	@Override
	public Integer getTotal(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.getTotal(record);
	}

	@Override
	public UserInfo findUserByUserCode(String userCode) {
		// TODO Auto-generated method stub
		UserInfo info = new UserInfo();
		info.setUserCode(userCode);
		return userInfoMapper.findByInfo(info).get(0);
	}

}
