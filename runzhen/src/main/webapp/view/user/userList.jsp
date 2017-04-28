<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String contextPath = request.getContextPath();
%>
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
	<table id="userListTable"
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
		        	data-formatter="">操作</th>
		    </tr>
	    </thead>
	</table>

<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>				
<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
<script type="text/javascript">

/* 格式化'操作'列 */
function operate_formatter(value,row,index){
	var jsonRow = JSON.stringify(row);
	return '<button type="button" onclick="editUser(\''+escape(jsonRow)+'\',\''+index+'\')" class="btn btn-primary btn-xs">查看</button>&nbsp;'+
			'<button type="button" onclick="" class="btn btn-danger btn-xs">删除</button>';
}

function editUser(jsonRow,index){
	var row = JSON.parse(unescape(jsonRow));		//先解码，再解析成json对象
}

/* 查询 */
function userList_search(){
	$("#userListTable").bootstrapTable('refresh');
}

/* 添加查询参数 */
function userListQueryParams(params){
	params.active = $("#userList_queryParam_active").val();
	params.userCode = $("#userList_queryParam_userCode").val();
	params.userName = $("#userList_queryParam_userName").val();
	return params;
}
</script>
</body>
</html>