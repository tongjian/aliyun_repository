package com.runzhen.user.domain;

import java.util.Date;

import com.runzhen.common.domain.BaseInfo;

public class RoleInfo extends BaseInfo{
    private Integer roleId;

    private String roleCode;

    private String roleName;

    private Date createDate;

    private String createUser;

    private String remark;

    private Date upateDate;

    private String upateUser;

    private String active;

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode == null ? null : roleCode.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser == null ? null : createUser.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getUpateDate() {
        return upateDate;
    }

    public void setUpateDate(Date upateDate) {
        this.upateDate = upateDate;
    }

    public String getUpateUser() {
        return upateUser;
    }

    public void setUpateUser(String upateUser) {
        this.upateUser = upateUser == null ? null : upateUser.trim();
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active == null ? null : active.trim();
    }
}