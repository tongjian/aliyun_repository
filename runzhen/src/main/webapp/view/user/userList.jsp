<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
</head>
<body>
	<form id="userList_queryForm" role="form" class="form-horizontal" action="">
         <div class="form-group">
            <label for="userCode" class="control-label col-sm-2">用户编号:</label>
            <div class="col-sm-2">
            	<input id="userList_queryParam_userCode" name="userCode" class="form-control" type="text" >
            </div>
            <label for="userName" class="control-label col-sm-2">用户名称:</label>
            <div class="col-sm-2">
            	<input id="userList_queryParam_userName" name="userName" class="form-control" type="text" >
            </div>
         	<label for="active" class="control-label col-sm-2">是否有效:</label>
         	<div class="col-sm-2">
				<select id="userList_queryParam_active" name="active" class="form-control">
					<option value="">全部</option>
					<option value="Y" selected>是</option>
					<option value="N">否</option>
				</select>
             </div>
         </div>
	</form>
	
	<div id="userList_toolbar" >
		<button id="sdfsdf" class="btn btn-success btn-sm" onclick="userList_search()">
		    <i class="glyphicon glyphicon-search"></i> 查询
		</button>
	</div>
	
	<!-- 用户列表 -->
	<table id="userList_table"
		data-toolbar="#userList_toolbar"
		data-toolbar-align="right"
		data-query-params="userListQueryParams"
		data-url="<%=contextPath%>/user/list"
		data-toggle="table"
		data-pagination="true"
		data-side-pagination="server"
		data-page-list="[5, 10, 20, 50]">
		<thead>
		    <tr>
		        <th data-field="" data-checkbox="true"></th>
		        <th data-field="userCode" data-align="center" data-sortable="true">用户名</th>
		        <th data-field="phoneNumber" data-align="center" data-sortable="true">电话</th>
		        <th data-field="email" data-align="center" data-sortable="true">邮箱</th>
		        <th data-field="createDate" data-align="center" data-sortable="true" 
		        	data-formatter="common_dateFormatter">创建日期</th>
		        <th data-field="active" data-align="center" data-sortable="true"
		        	data-formatter="common_activeFormatter">是否有效</th>
		        <th data-field="remark" data-align="center" data-sortable="true">说明</th>
		        <th data-field="userId" data-align="center" data-sortable="true"
		        	data-formatter="userListOperateFormatter">操作</th>
		    </tr>
	    </thead>
	</table>

	<!-- 用户编辑模态框 -->
    <div id="userList_modal" class="modal fade" data-backdrop="false" style="margin-top:60px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-title">
                    <h2 id="userList_modal_title" class="text-center">用户编辑</h2>
                </div>
                <div class="modal-body">
                    <form id="userList_form" role="form" class="form-group form-horizontal" action="">
						<div class="form-group">
							<input id="userList_userId" name="userId" type="hidden">
						    <label class="control-label col-sm-2">用户名:</label>
						    <div class="col-sm-4">
						        <input id="userList_userCode" name="userCode" class="form-control" type="text" />
						    </div>
						    <label class="control-label col-sm-2">中文名:</label>
						    <div class="col-sm-4">
						        <input id="userList_userName" name="userName" class="form-control" type="text" />
						    </div>
						</div>
						<div class="form-group">
						    <label class="control-label col-sm-2">手机号:</label>
						    <div class="col-sm-4">
						        <input id="userList_phoneNumber" name="phoneNumber" class="form-control" type="text" />
						    </div>
						    <label class="control-label col-sm-2">QQ:</label>
						    <div class="col-sm-4">
						        <input id="userList_qq" name="qq" class="form-control" type="text" />
						    </div>
						</div>
						<div class="form-group">
						    <label class="control-label col-sm-2">邮箱:</label>
						    <div class="col-sm-4">
						        <input id="userList_email" name="email" class="form-control" type="text" />
						    </div>
						    <label class="control-label col-sm-2">出生日期:</label>
						    <div class="col-sm-4">
								<input id="userList_birthDate" name="birthDate" type="text" class="form-control datepicker">
						    </div>
						</div>
						<div class="form-group">
						    <label class="control-label col-sm-2">性别:</label>
						    <div class="col-sm-4">
						        <select id="userList_sex" name="sex" class="form-control">
							    	<option value="1">男</option>
							    	<option value="0">女</option>
							    </select>
						    </div>
						    <label class="control-label col-sm-2">是否有效:</label>
						    <div class="col-sm-4">
						        <select id="userList_active" name="active" class="form-control">
							    	<option value="Y">是</option>
							    	<option value="N">否</option>
							    </select>
						    </div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">角色:</label>
						    <div class="col-sm-4">
						    </div>
							<label class="control-label col-sm-2">地址:</label>
						    <div class="col-sm-4">
						        <input id="userList_address" name="address" class="form-control" type="text" />
						    </div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-2">说明:</label>
							 <div class="col-sm-6">
						        <textarea id="userList_remark" name="remark" class="form-control" rows="3" ></textarea>
						    </div>
						</div>
						<div class="form-group">
						    <div class="col-sm-offset-5 col-sm-4">
						        <button type="button" onclick="userList_save()" class="btn btn-success btn-default">保存</button>
						        <button class="btn btn-danger" data-dismiss="modal">取消</button>
						    </div>
						</div>
					</form>
	              </div>
           </div>
       </div>
   </div>

<script src="<%=contextPath %>/js/jquery-1.12.4.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>				
<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=contextPath %>/js/bootstrapvalidator-0.4.5/dist/js/bootstrapValidator.js"></script>	
<script src="<%=contextPath %>/js/common.js"></script>
<script src="<%=contextPath %>/js/util.js"></script>
<script type="text/javascript">

$(function(){
	util_user_bootstrapValidator('userList');			//用户验证
});

/* 格式化'操作'列 */
function userListOperateFormatter(value,row,index){
	var jsonRow = JSON.stringify(row);
	return '<button type="button" onclick="userList_editUser(\''+escape(jsonRow)+'\',\''+index+'\')" class="btn btn-primary btn-xs">修改</button>&nbsp;'+
			'<button type="button" onclick="userList_deleteUser('+value+')" class="btn btn-danger btn-xs">删除</button>';
}

function userList_editUser(jsonRow,index){
	var row = JSON.parse(unescape(jsonRow));		//先解码，再解析成json对象
	$("#userList_modal_title").text("修改用户");
	$("#userList_modal").modal('show');
	$("#userList_form")[0].reset();
	
	/* 初始化角色信息 */
	util_user_setFormData('userList',row);
}

//删除用户
function userList_deleteUser(userId){
	BootstrapDialog.confirm({
        title: '提示信息',
        message: '确定删除此用户?',
        btnCancelLabel: '取消', // <-- Default value is 'Cancel',
        btnOKLabel: '确定', // <-- Default value is 'OK',
        callback: function(result) {
            if(result) {
            	$.ajax({
            		url:'<%=contextPath %>/user/deleteUser',
            		data:{
            			'userId' : userId
            		},
            		success:function(resultObj){
            			BootstrapDialog.show({
            				title:'提示信息',
            				message:resultObj.resultMessage,
            				closable: false,		//不能自动关闭
            				buttons:[{
            					label:'确定',
            					action:function(dialog){
            						dialog.close();
            						if(resultObj.resultCode == "success"){
            							$("#userList_table").bootstrapTable('refresh');
            						}
            					}
            				}]
            			});
            		}
            	});
            }
        }
    });
}

/* 查询 */
function userList_search(){
	$("#userList_table").bootstrapTable('refresh');
}

/* 添加查询参数 */
function userListQueryParams(params){
	params.active = $("#userList_queryParam_active").val();
	params.userCode = $("#userList_queryParam_userCode").val();
	params.userName = $("#userList_queryParam_userName").val();
	return params;
}

/* 保存 */
function userList_save(){
	$("#userList_form").data("bootstrapValidator").validate();
	var flag = $("#userList_form").data("bootstrapValidator").isValid();
	if(flag){
		util_form_save('userList','<%=contextPath%>/user/update',util_user_getFormData("userList"),'modal');
	}
}
</script>
</body>
</html>