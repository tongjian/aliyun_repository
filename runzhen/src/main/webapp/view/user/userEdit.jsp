<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String contextPath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link rel="stylesheet" href="../js/bootstrap-datepicker-master/dist/css/bootstrap-datepicker3.min.css">
</head>
<body>
<div class="form-horizontal">
	<form id="userinfo_form" role="form" action="">
		<div class="form-group">
			<input id="userInfo_userId" name="userId" type="hidden" value="${sessionScope.userId}">
		    <label class="control-label col-sm-2">用户名:</label>
		    <div class="col-sm-3">
		        <input id="userInfo_userCode" name="userCode" class="form-control" type="text" />
		    </div>
		    <label class="control-label col-sm-2">中文名:</label>
		    <div class="col-sm-3">
		        <input id="userInfo_userName" name="userName" class="form-control" type="text" />
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2">手机号:</label>
		    <div class="col-sm-3">
		        <input id="userInfo_phoneNumber" name="phoneNumber" class="form-control" type="text" />
		    </div>
		    <label class="control-label col-sm-2">QQ:</label>
		    <div class="col-sm-3">
		        <input id="userInfo_qq" name="qq" class="form-control" type="text" />
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2">邮箱:</label>
		    <div class="col-sm-3">
		        <input id="userInfo_email" name="email" class="form-control" type="text" />
		    </div>
		    <label class="control-label col-sm-2">出生日期:</label>
		    <div class="col-sm-3">
				<input id="userInfo_birthDate" name="birthDate" type="text" class="form-control">
		    </div>
		</div>
		<div class="form-group">
		    <label class="control-label col-sm-2">性别:</label>
		    <div class="col-sm-3">
		        <select id="userInfo_sex" name="sex" class="form-control">
			    	<option value="1">男</option>
			    	<option value="0">女</option>
			    </select>
		    </div>
		    <label class="control-label col-sm-2">是否有效:</label>
		    <div class="col-sm-3">
		        <select id="userInfo_active" name="active" class="form-control">
			    	<option value="Y">是</option>
			    	<option value="N">否</option>
			    </select>
		    </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">地址:</label>
		    <div class="col-sm-5">
		        <input id="userInfo_address" name="address" class="form-control" type="text" />
		    </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">说明:</label>
			 <div class="col-sm-5">
		        <textarea id="userInfo_remark" name="remark" class="form-control" rows="3" ></textarea>
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-5 col-sm-4">
		        <button type="button" onclick="userinfo_save()" class="btn btn-success btn-default">保存</button>
		    </div>
		</div>
	</form>
</div>

<!-- <script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<script src="../js/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../js/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">

//页面初始化
$( function() {
	var userId = $("#userInfo_userId").val();
	if(userId != '' && userId != undefined){
		$.ajax({
			url: '<%=contextPath%>/user/selectByPrimaryKey',
			data:{
				'userId':userId
			},
			success:function(data){
				initFormData(data);
			}
		});
	}else{
		loginAgain();
	}
	
	$('#userInfo_birthDate').datepicker({
		language: "zh-CN",
	    autoclose: true,		//选中之后自动隐藏日期选择框
	    clearBtn: true,			//清除按钮
	    todayBtn: 'linked',		//今日按钮
	    format: "yyyy-mm-dd"	//日期格式
	});
 } );

//保存表单数据
function userinfo_save(){
	var userId = $("#userInfo_userId").val();
	if(userId != '' && userId != undefined){
		$.ajax({
			dataType:'json',
			type: "POST",
			url:'<%=contextPath%>/user/update',
			data:{
				'userId':$("#userInfo_userId").val(),
				'userCode':$("#userInfo_userCode").val(),
				'userName':$("#userInfo_userName").val(),
				'phoneNumber':$("#userInfo_phoneNumber").val(),
				'qq':$("#userInfo_qq").val(),
				'email':$("#userInfo_email").val(),
				'birthDate':$("#userInfo_birthDate").datepicker('getDate'),
				'sex':$("#userInfo_sex").val(),
				'active':$("#userInfo_active").val(),
				'address':$("#userInfo_address").val(),
				'remark':$("#userInfo_remark").val()
			},
			success:function(data){
				if(data.resultCode == 'success'){
					BootstrapDialog.show({
						type:BootstrapDialog.TYPE_SUCCESS,
						title:'提示信息',
						message:'保存成功',
						closable: false,		//不能自动关闭
						buttons:[{
							label:'确定',
							action:function(dialog){
								//dialog.close();
								location.reload();
							}
						}]
					});
				}else{
					BootstrapDialog.show({
						type:BootstrapDialog.TYPE_DANGER,
						title:'提示信息',
						message:'保存失败,请联系管理员',
						closable: false,		//不能自动关闭
						buttons:[{
							label:'确定',
							action:function(dialog){
								//dialog.close();
								location.reload();
							}
						}]
					});
				}
			}
		});
	}else{
		loginAgain();
	}
}

//初始化表单数据
function initFormData(data){
	$("#userInfo_userCode").val(data.userCode);
	$("#userInfo_userName").val(data.userName);
	$("#userInfo_phoneNumber").val(data.phoneNumber);
	$("#userInfo_qq").val(data.qq);
	$("#userInfo_email").val(data.email);
	$("#userInfo_birthDate").datepicker('setDate',new Date(data.birthDate));
	$("#userInfo_sex").val(data.sex);
	$("#userInfo_active").val(data.active);
	$("#userInfo_address").val(data.address);
	$("#userInfo_remark").val(data.remark);
}

//页面超时，重新登录
function loginAgain(){
	BootstrapDialog.show({
		type:BootstrapDialog.TYPE_DANGER,
		title:'提示信息',
		message:'页面超时,请重新登录',
		closable: false,		//不能自动关闭
		buttons:[{
			label:'确定',
			action:function(dialog){
				location.href = "<%=contextPath%>/common/forward?page=main";
			}
		}]
	});
}
</script>
</body>
</html>