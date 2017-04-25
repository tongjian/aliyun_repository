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
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../image/favicon.ico">

    <title>控制台</title>

    <!-- Bootstrap core CSS -->
    <link href="../js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

	<link href="../js/bootstrap3-dialog-master/dist/css/bootstrap-dialog.min.css" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    
    <link rel="stylesheet" href="../js/bootstrap-panel/lib/jquery-ui.min.css"/>
	<link rel="stylesheet" href="../js/bootstrap-panel/dist/css/lobipanel.min.css"/>

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../js/html5shiv.min.js"></script>
	  <script src="../js/respond.min.js"></script>
    <![endif]-->
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
            <li><a href="#" onclick="load_userlist()">用户管理</a></li>
            <li><a href="#">角色管理</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
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

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery-1.12.4.min.js"></script>
    <script>window.jQuery || document.write('<script src="../js/jquery-1.12.4.min.js"><\/script>')</script>
	<script src="../js/bootstrap-panel/lib/jquery-ui.min.js"></script>
	<script src="../js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	<script src="../js/bootstrap3-dialog-master/dist/js/bootstrap-dialog.min.js"></script>
	
	<script src="../js/bootstrap-panel/dist/js/lobipanel.min.js"></script>
	
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../js/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../js/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript">  
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

//加载用户列表
function load_userlist(){
	$("#panel_div").css("display","block");
	$("#panel_title").text("用户管理");
	$('#panel_div').lobiPanel({
        // 配置参数
		loadUrl:"<%=contextPath%>/common/forward?page=user/userList"
    });
	
}
</script>
  </body>
</html>
