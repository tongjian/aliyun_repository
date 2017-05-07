package com.runzhen.user.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.runzhen.common.util.CommonUtil;
import com.runzhen.user.UserConstant;
import com.runzhen.user.dao.UserRoleMapper;
import com.runzhen.user.domain.UserInfo;
import com.runzhen.user.domain.UserRole;
import com.runzhen.user.service.IUserRoleService;

@Service("userRoleService")
public class UserRoleServiceImpl implements IUserRoleService {
	
	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userRoleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.insert(record);
	}

	@Override
	public int insertSelective(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.insertSelective(record);
	}

	@Override
	public UserRole selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userRoleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<UserRole> selectByPage(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.selectByPage(record);
	}

	@Override
	public int getTotal(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.getTotal(record);
	}

	@Override
	public List<UserRole> findByInfo(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.findByInfo(record);
	}

	@Override
	public List<Integer> findRoleIdsByInfo(UserRole record) {
		// TODO Auto-generated method stub
		return userRoleMapper.findRoleIdsByInfo(record);
	}

	//修改用户的角色关系配置
	@Override
	public String changeUserRoleReleative(UserInfo userInfo,Integer[] roleIds,HttpSession httpSession) {
		List<Integer> roleIdsListFromPage = new ArrayList<Integer>(Arrays.asList(roleIds));;
		
		//查询对应用户的角色列表
		UserRole userRoleInfo = new UserRole();
		userRoleInfo.setUserId(String.valueOf(userInfo.getUserId()));
		List<Integer> userRoleIdsFromDb = userRoleMapper.findRoleIdsByInfo(userRoleInfo);
		
		List<Integer> addUserRoleIdsList = new ArrayList<Integer>();			//保存需要新增的用户角色的id
		for(Integer pageRoleId : roleIdsListFromPage){
			if(!userRoleIdsFromDb.contains(pageRoleId)){
				addUserRoleIdsList.add(pageRoleId);
			}
		}
		
		List<Integer> deleteUserRoleIdsList = new ArrayList<Integer>();			//保存需要删除的用户角色的id
		for(Integer dbRoleId : userRoleIdsFromDb){
			if(!roleIdsListFromPage.contains(dbRoleId)){
				deleteUserRoleIdsList.add(dbRoleId);
			}
		}
		
		//批量新增用户角色关系
		if(!CollectionUtils.isEmpty(addUserRoleIdsList)){
			List<UserRole> addUserRoleList = this.createUserRoleInfo(addUserRoleIdsList, userInfo, httpSession);
			this.batchInsertUserRole(addUserRoleList);
		}
		
		//批量删除用户角色关系
		if(!CollectionUtils.isEmpty(deleteUserRoleIdsList)){
			List<UserRole> deleteUserRoleList = this.createUserRoleInfo(deleteUserRoleIdsList, userInfo, httpSession);
			this.batchDeleteUserRole(deleteUserRoleList);
		}
		return CommonUtil.RESULT_STATUS_SUCCESS;
	}
	
	/* 生成用户角色关系类 */
	private List<UserRole> createUserRoleInfo(List<Integer> roleIds,UserInfo userInfo,HttpSession httpSession){
		List<UserRole> userRoleList = new ArrayList<UserRole>();
		for(Integer roleId : roleIds){
			UserRole info = new UserRole();
			info.setActive(UserConstant.ACTIVITE_ON);
			info.setUserId(String.valueOf(userInfo.getUserId()));
			info.setRoleId(String.valueOf(roleId));
			info.setCreateDate(new Date());
			info.setCreateUser(String.valueOf(httpSession.getAttribute("userId")));
			userRoleList.add(info);
		}
		
		return userRoleList;
	}

	//批量新增用户角色关系
	@Override
	public void batchInsertUserRole(List<UserRole> userRoleList) {
		// TODO Auto-generated method stub
		userRoleMapper.batchInsertUserRole(userRoleList);
	}

	@Override
	public void batchDeleteUserRole(List<UserRole> userRoleList) {
		// TODO Auto-generated method stub
		userRoleMapper.batchDeleteUserRole(userRoleList);
	}

}
