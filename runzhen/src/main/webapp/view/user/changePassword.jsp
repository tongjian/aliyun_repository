<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
</head>
<body>
<div class="form-horizontal">
	<form id="changePassword_form" role="form" action="">
		<div class="form-group">
			<input id="changePassword_userId" name="userId" type="hidden" value="${sessionScope.userId}">
		    <label class="control-label col-sm-4">旧密码:</label>
		    <div class="col-sm-3">
		        <input name="password" class="form-control" type="text" />
		    </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">新密码:</label>
		    <div class="col-sm-3">
		        <input name="newPassword" class="form-control" type="password" />
		    </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-4">重复密码:</label>
		    <div class="col-sm-3">
		        <input name="repassword" class="form-control" type="password" />
		    </div>
		</div>
		<div class="form-group">
		    <div class="col-sm-offset-5 col-sm-4">
		        <button type="button" onclick="changePassword_save()" class="btn btn-success btn-default">保存</button>
		    </div>
		</div>
	</form>
</div>

<script src="<%=contextPath%>/js/bootstrapvalidator-0.4.5/dist/js/bootstrapValidator.js"></script>
<script type="text/javascript">
//密码验证
$('#changePassword_form').bootstrapValidator({
	message : '表单验证不通过.',
	fields : {
		newPassword : {
			message : '密码验证不通过.',
			validators : {
				notEmpty : {
					message : '密码不能为空.'
				},
				stringLength : {
					min:6,
					message : '密码至少6位字母或数字.'
				},
				regexp : {
					regexp: /^[a-zA-z0-9]+$/,
					message : '用户名必须由数字字母组成.'
				}
			}
		},
		repassword : {
			message : '密码验证不通过.',
			validators : {
				notEmpty : {
					message : '密码不能为空.'
				},
				identical: {//相同
				    field: 'newPassword', //需要进行比较的input name值
				    message: '两次密码不一致'
				}
			}
		}
	}
});

/* 保存修改后的密码 */
function changePassword_save(){
	$("#changePassword_form").data("bootstrapValidator").validate();
	var flag = $("#changePassword_form").data("bootstrapValidator").isValid();
	if(flag){
		$.ajax({
			dataType:'json',
			cache:false,
			url : '<%=contextPath%>/user/changePassword',
			data : $("#changePassword_form").serializeArray(),
			success:function(result){
				BootstrapDialog.show({
					type:BootstrapDialog.TYPE_INFO,
					title:'提示信息',
					closable: false,		//不能自动关闭
					message:result.resultMessage,
					buttons:[{
						label:'确定',
						action:function(dialog){
							//dialog.close();
							location.reload();
						}
					}]
				});
			}
		});
	}
}
</script>
</body>
</html>