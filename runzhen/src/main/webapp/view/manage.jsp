<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../image/favicon.ico">
    <title>控制台</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=contextPath %>/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">							<!-- 基本样式 -->
    <link href="<%=contextPath %>/js/bootstrap-table-develop/dist/bootstrap-table.min.css" rel="stylesheet">				<!-- 表格样式 -->
	<link href="<%=contextPath %>/js/bootstrapvalidator-0.4.5/dist/css/bootstrapValidator.min.css" rel="stylesheet">		<!-- 表单验证样式 -->
	<link href="<%=contextPath %>/js/bootstrap3-dialog-master/dist/css/bootstrap-dialog.min.css" rel="stylesheet">			<!-- 对话框样式 -->
	<link href="<%=contextPath %>/js/bootstrap-datepicker-master/dist/css/bootstrap-datepicker3.min.css" rel="stylesheet">		<!-- 日期框样式 -->
    
    <link href="<%=contextPath %>/js/lobipanel-master/lib/jquery-ui.min.css" rel="stylesheet" >			<!-- jquery-ui样式 -->
	<link href="<%=contextPath %>/js/lobipanel-master/dist/css/lobipanel.min.css" rel="stylesheet" >		<!-- 面板样式 -->

    <!-- Custom styles for this template -->
    <link href="<%=contextPath %>/css/dashboard.css" rel="stylesheet">
  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">控制台</a>
        </div>
         <div>
	    	<input id="userCode_hidden" type="hidden" value="${sessionScope.userCode}">
	        <!--向右对齐-->
	        <form class="navbar-form navbar-right" >
	        </form>
	        <ul class="nav navbar-nav navbar-right">
	        	<li><a href="#" onclick="logout_click()"><span class="glyphicon glyphicon-user"></span>注销</a></li>
	        </ul>
	        <p id="userCode_p" class="navbar-text navbar-right">
	        	<strong>用户名:</strong>&nbsp;<em>${sessionScope.userCode}</em>
	        </p>
	    </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="#" onclick="manage_initPanel('用户管理','user/userList')" class="active">用户管理</a></li>
            <li><a href="#" onclick="manage_initPanel('角色管理','user/roleList')">角色管理</a></li>
            <li><a href="#" onclick="manage_initPanel('个人信息','user/userEdit')">个人信息</a></li>
            <li><a href="#" onclick="manage_initPanel('密码修改','user/changePassword')">修改密码</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">日志管理</a></li>
            <li><a href="">权限管理</a></li>
            <li><a href="">菜单管理</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        	
        	<div id="panel_div" class="panel panel-default" style="display:none">
			    <div class="panel-heading">
			        <div class="panel-title">
			            <h4 id="panel_title"></h4>
			        </div>
			    </div>
			    <div class="panel-body">
			    </div>
			</div>    

        </div>
      </div>
    </div>

	<script src="<%=contextPath %>/js/jquery-3.2.1.js"></script>
    <%-- <script src="<%=contextPath %>/js/jquery-1.12.4.min.js"></script> --%>		<!-- jquery  -->
	<%-- <script src="<%=contextPath %>/js/lobipanel-master/lib/jquery.1.11.min.js"></script> --%>			<!-- jquery-ui -->
	<script src="<%=contextPath %>/js/lobipanel-master/lib/jquery-ui.min.js"></script>			<!-- jquery-ui -->
	<script src="<%=contextPath %>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>		<!-- bootstrap -->
	<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>					<!-- bootstrap表格插件 -->
	<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
	<!-- bootstrap表格编辑插件 -->
	<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/extensions/editable/bootstrap-table-editable.min.js"></script>					
	<script src="<%=contextPath %>/js/bootstrap3-dialog-master/dist/js/bootstrap-dialog.min.js"></script>				<!-- bootstrap对话框插件 -->
	<script src="<%=contextPath %>/js/bootstrapvalidator-0.4.5/dist/js/bootstrapValidator.js"></script>				<!-- bootstrap验证插件 -->
	<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>		<!-- bootstrap日期插件 -->
	<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
	<script src="<%=contextPath %>/js/lobipanel-master/dist/js/lobipanel.min.js"></script>		<!-- bootstrap面板插件 -->
	<script src="<%=contextPath %>/js/json2.js"></script>
	<script src="<%=contextPath %>/js/common.js"></script>
	
<script type="text/javascript">  
var panelInstance ;			//面板实例	

/* 页面初始化 */
$( function() {
	$("#panel_div").css("display","block");
	$("#panel_title").text("用户管理");
	$('#panel_div').lobiPanel({
        // 配置参数
		loadUrl : '<%=contextPath%>/common/forward?page=user/userList'
    });
	
	panelInstance = $('#panel_div').data('lobiPanel');
});
<%-- 		loadUrl : '<%=contextPath%>/common/forward?page=user/userList' --%>
		<%-- loadUrl : '<%=contextPath%>/common/forward?page=user/roleList' --%>

/* 加载面板 */
function manage_initPanel(title,forwardPage){
	$("#panel_title").text(title);
	if(forwardPage != '' && forwardPage != undefined){
		var url = '<%=contextPath%>/common/forward?page='+forwardPage+'';
		panelInstance.setLoadUrl(url).load();
	}
}

//注销
function logout_click(){
	$.ajax({
		dataType:'json',
		cache:false,
		url : '../user/logout',
		success:function(result){
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
							location.href = "<%=contextPath%>/common/forward?page=main";
						}
					}
				}]
			});
		}
	});
}

</script>
</body>
</html>
