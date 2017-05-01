<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
</head>
<body>
<div class="form-horizontal">
	<form id="userEdit_form" role="form" action="">
		<div class="form-group">
			<input id="userEdit_userId" name="userId" type="hidden" value="${sessionScope.userId}">
		    <label class="control-label col-sm-2">用户名:</label>
		    <div class="col-sm-3">
		        <input id="userEdit_userCode" name="userCode" class="form-control" type="text" />
		    </div>
		    <label class="control-label col-sm-2">中文名:</label>
		    <div class="col-sm-3">
		        <input id="userEdit_userName" name="userName" class="form-control" type="text" />
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2">手机号:</label>
		    <div class="col-sm-3">
		        <input id="userEdit_phoneNumber" name="phoneNumber" class="form-control" type="text" />
		    </div>
		    <label class="control-label col-sm-2">QQ:</label>
		    <div class="col-sm-3">
		        <input id="userEdit_qq" name="qq" class="form-control" type="text" />
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2">邮箱:</label>
		    <div class="col-sm-3">
		        <input id="userEdit_email" name="email" class="form-control" type="text" />
		    </div>
		    <label class="control-label col-sm-2">出生日期:</label>
		    <div class="col-sm-3">
				<input id="userEdit_birthDate" name="birthDate" type="text" class="form-control datepicker">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2">性别:</label>
		    <div class="col-sm-3">
		        <select id="userEdit_sex" name="sex" class="form-control">
			    	<option value="1">男</option>
			    	<option value="0">女</option>
			    </select>
		    </div>
		    <label class="control-label col-sm-2">是否有效:</label>
		    <div class="col-sm-3">
		        <select id="userEdit_active" name="active" class="form-control">
			    	<option value="Y">是</option>
			    	<option value="N">否</option>
			    </select>
		    </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">地址:</label>
		    <div class="col-sm-3">
		        <input id="userEdit_address" name="address" class="form-control" type="text" />
		    </div>
			<label class="control-label col-sm-2">角色:</label>
		    <div class="col-sm-3">
		        <select id="userEdit_roles" class="form-control" data-placeholder="请选择角色..." 
		        	multiple="multiple"></select>
		    </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">说明:</label>
			 <div class="col-sm-5">
		        <textarea id="userEdit_remark" name="remark" class="form-control" rows="3" ></textarea>
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-5 col-sm-4">
		        <button type="button" onclick="userEdit_save()" class="btn btn-success btn-default">保存</button>
		    </div>
		</div>
	</form>
</div>

<script src="<%=contextPath %>/js/jquery-1.12.4.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=contextPath %>/js/bootstrapvalidator-0.4.5/dist/js/bootstrapValidator.js"></script>	
<script src="<%=contextPath %>/js/select2-master/dist/js/select2.js"></script>
<script src="<%=contextPath %>/js/common.js"></script>
<script src="<%=contextPath %>/js/util.js"></script>
<script type="text/javascript">

//页面初始化
$( function() {
	util_user_bootstrapValidator('userEdit');			//初始化表单验证条件
	
	//初始化'角色'下拉框 
	$("#userEdit_roles").select2( { 
		data : common_getRoleList()
	} );
	
	var userId = $("#userEdit_userId").val();
	if(userId != '' && userId != undefined){
		$.ajax({
			url: '<%=contextPath%>/user/selectByPrimaryKey',
			data:{
				'userId':userId
			},
			success:function(data){
				util_user_setFormData('userEdit',data);
			}
		});
	}else{
		util_loginAgain();
	}
	
 } );

//保存表单数据
function userEdit_save(){
	/* $("#userEdit_roles").val([1,2]).trigger("change");
	
	var t = $("#userEdit_roles").val();
	alert("3:"+t);
	return ; */
	
	var userId = $("#userEdit_userId").val();
	if(userId != '' && userId != undefined){
		util_form_save('userEdit','<%=contextPath%>/user/update',util_user_getFormData('userEdit'));
	}else{
		util_loginAgain();			//登录超时，重新登录
	}
}

</script>
</body>
</html>