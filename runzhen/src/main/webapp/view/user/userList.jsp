<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String contextPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<link href="../js/bootstrap-table-develop/dist/bootstrap-table.min.css" rel="stylesheet">
</head>
<body>
	<!-- 用户列表 -->
	<table id="userlist_table"
		data-url="<%=contextPath%>/user/list"
		data-toggle="table"
		data-pagination="true"
		data-side-pagination="server"
		data-page-list="[5, 10, 20, 50]">
		<thead>
		    <tr>
		        <th data-field="id" data-checkbox="true"></th>
		        <th data-field="userCode" data-align="center" data-sortable="true">用户名</th>
		        <th data-field="phoneNumber" data-align="center" data-sortable="true">电话</th>
		        <th data-field="email" data-align="center" data-sortable="true">邮箱</th>
		        <th data-field="createDate" data-align="center" data-sortable="true" 
		        	data-formatter="date_formatter">创建日期</th>
		        <th data-field="active" data-align="center" data-sortable="true"
		        	data-formatter="active_formatter">是否有效</th>
		        <th data-field="remark" data-align="center" data-sortable="true">说明</th>
		        <th data-field="" data-align="center" data-sortable="true"
		        	data-formatter="operate_formatter">操作</th>
		    </tr>
	    </thead>
	</table>
	
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="../js/json2.js"></script>
<script src="../js/common.js"></script>
<script type="text/javascript">

/* 格式化'操作'列 */
function operate_formatter(value,row,index){
	var jsonRow = JSON.stringify(row);
	return '<button type="button" onclick="editUser(\''+escape(jsonRow)+'\',\''+index+'\')" class="btn btn-primary btn-xs">修改</button>&nbsp;'+
			'<button type="button" onclick="" class="btn btn-danger btn-xs">删除</button>';
}

function editUser(jsonRow,index){
	var row = JSON.parse(unescape(jsonRow));		//先解码，再解析成json对象
}

function deleteUser(row,index){
	
}

/* 格式化日期输出 */
function date_formatter(value,row,index){
	if(value != '' && value != undefined){
		return  new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
}

/* 格式化输出 */
function active_formatter(value,row,index){
	return value == 'Y' ? "有效":"无效";
}
</script>
</body>
</html>