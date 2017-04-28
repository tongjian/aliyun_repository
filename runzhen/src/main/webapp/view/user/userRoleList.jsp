<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户角色配置</title>
</head>
<body>
	<form id="userRoleList_queryForm" role="form" class="form-horizontal" action="">
         <div class="form-group">
            <label for="roleCode" class="control-label col-sm-1">角色编号:</label>
            <div class="col-sm-2">
            	<input id="userRoleList_queryParam_roleCode" name="roleCode" class="form-control" type="text" >
            </div>
            <label for="roleName" class="control-label col-sm-1">角色名称</label>
            <div class="col-sm-2">
            	<input id="userRoleList_queryParam_roleName" name="roleName" class="form-control" type="text" >
            </div>
         	<label for="active" class="control-label col-sm-1">是否有效:</label>
         	<div class="col-sm-2">
				<select id="userRoleList_queryParam_active" name="active" class="form-control">
					<option value="">全部</option>
					<option value="Y" selected>是</option>
					<option value="N">否</option>
				</select>
             </div>
         </div>
         <div  class="form-group">
         	<label for="userCode" class="control-label col-sm-1">用户编号:</label>
            <div class="col-sm-2">
            	<input id="userRoleList_queryParam_userCode" name="userCode" class="form-control" type="text" >
            </div>
            <label for="userName" class="control-label col-sm-1">用户名称</label>
            <div class="col-sm-2">
            	<input id="userRoleList_queryParam_userName" name="userName" class="form-control" type="text" >
            </div>
         </div>
	</form>
	
	<!-- 表格工具栏 -->
	<div id="userRoleList_toolbar" >
		<button id="userRoleList_append" class="btn btn-success btn-sm" onclick="userRoleList_append()">
		    <i class="glyphicon glyphicon-plus"></i> 新增
		</button>
		<button id="userRoleList_append" class="btn btn-success btn-sm" onclick="userRoleList_search()">
		    <i class="glyphicon glyphicon-search"></i> 查询
		</button>
	</div>
	<!-- 用户角色列表 -->
	<table id="userRolelist_table"
		data-toolbar="#userRoleList_toolbar"
		data-toolbar-align="right"
		data-query-params="userRoleList_queryParams"
		data-url="<%=contextPath%>/userRole/list"
		data-toggle="table"
		data-pagination="true"
		data-side-pagination="server"
		data-page-list="[5, 10, 20, 50]">
		<thead>
		    <tr>
		        <th data-field="" data-checkbox="true"></th>
		        <th data-field="roleCode" data-align="center" data-sortable="true" data-editable="true">角色编号</th>
		        <th data-field="roleName" data-align="center" data-sortable="true" data-editable="true"
		        	data-title="角色" data-type="select">角色名称</th>
		        <th data-field="userCode" data-align="center" data-sortable="true" data-editable="true">用户编号</th>
		        <th data-field="userName" data-align="center" data-sortable="true" data-editable="true"
		        	data-title="用户">用户名</th>
		        <th data-field="createDate" data-align="center" data-sortable="true" 
		        	data-formatter="common_dateFormatter">创建日期</th>
		        <th data-field="active" data-align="center" data-sortable="true" data-editable="true"
		        	data-formatter="common_activeFormatter">是否有效</th>
		        <th data-field="remark" data-align="center" data-sortable="true" data-editable="true">说明</th>
		        <th data-field="id" data-align="center" data-sortable="true"
		        	data-formatter="userRoleList_operateFormatter">操作</th>
		    </tr>
	    </thead>
	</table>
	
<!-- <script src="../js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="../js/json2.js"></script>
<script src="../js/common.js"></script> -->
<script type="text/javascript">

/* 新增角色 */
function userRoleList_append(){
	$("#userRoleList_modal_title").text("新建用户角色关系");
	$("#userRoleList_modal").modal('show');
	$("#userRoleList_form")[0].reset();				//重置表单
	$("#userRoleList_roleId").val('');				//清除隐藏域的值
}

/* 保存 */
function userRoleList_save(){
	$("#userRoleList_form").data("bootstrapValidator").validate();
	var flag = $("#userRoleList_form").data("bootstrapValidator").isValid();
	if(flag){
		$.ajax({
			dataType:'json',
			url:'<%=contextPath%>/role/save',
			data:$("#userRoleList_form").serializeArray(),
			success:function(result){
				$('#userRoleList_modal').modal('hide');
				BootstrapDialog.show({
					type:BootstrapDialog.TYPE_INFO,
					title:'提示信息',
					message:result.resultMessage,
					closable: false,		//不能自动关闭
					buttons:[{
						label:'确定',
						action:function(dialog){
							dialog.close();
							if(result.resultCode == "success"){
								$("#userRoleList_table").bootstrapTable('refresh');
							}
						}
					}]
				});
			}
		});
	}
}

/* 格式化'操作'列 */
function userRoleList_operateFormatter(value,row,index){
	var jsonRow = JSON.stringify(row);
	return '<button type="button" onclick="userRoleList_editRole(\''+escape(jsonRow)+'\',\''+index+'\')" class="btn btn-primary btn-xs">修改</button>&nbsp;';
}

/* 修改角色信息 */
function userRoleList_editRole(jsonRow,index){
	var row = JSON.parse(unescape(jsonRow));		//先解码，再解析成json对象
	$("#userRoleList_modal_title").text("用户角色编辑");
	$("#userRoleList_modal").modal('show');
	$("#userRoleList_form")[0].reset();
	
	/* 初始化角色信息 */
	$("#userRoleList_roleId").val(row.roleId);
	$("#userRoleList_roleCode").val(row.roleCode);
	$("#userRoleList_roleName").val(row.roleName);
	$("#userRoleList_active").val(row.active);
	$("#userRoleList_remark").val(row.remark);
}

/* 查询 */
function userRoleList_search(){
	$("#userRoleList_table").bootstrapTable('refresh');
}

/* 添加查询参数 */
function userRoleList_queryParams(params){
	params.active = $("#userRoleList_queryParam_active").val();				//是否有效
	params.roleCode = $("#userRoleList_queryParam_roleCode").val();			//角色编号
	params.roleName = $("#userRoleList_queryParam_roleName").val();			//角色名称
	params.userCode = $("#userRoleList_queryParam_userCode").val();			//用户编号
	params.userName = $("#userRoleList_queryParam_userName").val();			//用户名称
	return params;
}


</script>
</body>
</html>