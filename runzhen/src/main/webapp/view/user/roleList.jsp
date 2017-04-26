<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String contextPath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色列表</title>
<link href="../js/bootstrap-table-develop/dist/bootstrap-table.min.css" rel="stylesheet">
</head>
<body>
	<!-- 用户列表 -->
	<table id="rolelist_table"
		data-url="<%=contextPath%>/role/list"
		data-toggle="table"
		data-pagination="true"
		data-side-pagination="server"
		data-page-list="[5, 10, 20, 50]">
		<thead>
		    <tr>
		        <th data-field="roleId" data-checkbox="true"></th>
		        <th data-field="roleCode" data-align="center" data-sortable="true">角色编码</th>
		        <th data-field="roleName" data-align="center" data-sortable="true">角色名称</th>
		        <th data-field="createDate" data-align="center" data-sortable="true" 
		        	data-formatter="common_dateFormatter">创建日期</th>
		        <th data-field="active" data-align="center" data-sortable="true"
		        	data-formatter="common_activeFormatter">是否有效</th>
		        <th data-field="remark" data-align="center" data-sortable="true">说明</th>
		        <th data-field="" data-align="center" data-sortable="true"
		        	data-formatter="roleList_operateFormatter">操作</th>
		    </tr>
	    </thead>
	</table>
	
<!-- <script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<script src="../js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="../js/json2.js"></script>
<script src="../js/common.js"></script>
<script type="text/javascript">

/* 格式化'操作'列 */
function roleList_operateFormatter(value,row,index){
	var jsonRow = JSON.stringify(row);
	return '<button type="button" onclick="editUser(\''+escape(jsonRow)+'\',\''+index+'\')" class="btn btn-primary btn-xs">修改</button>&nbsp;'+
			'<button type="button" onclick="" class="btn btn-danger btn-xs">删除</button>';
}

</script>
</body>
</html>