<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>首页</title>
<link rel="icon" href="image/favicon.ico">
<link href="js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/jumbotron.css" rel="stylesheet">
<style>
</style>
<!-- [if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <div class="navbar-form navbar-right">
            <button type="button" class="btn btn-success" 
            	data-toggle="modal" data-target="#login" >登录</button>
          </div>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Hello, world!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; 2016 Company, Inc.</p>
      </footer>
     </div>
     
     <!-- 注册窗口 -->
     <div id="register" class="modal fade" tabindex="-1" style="margin-top:50px;">
         <div class="modal-dialog">
             <div class="modal-content">
                 <div class="modal-body">
                     <button class="close" data-dismiss="modal">
                         <span>&times;</span>
                     </button>
                 </div>
                 <div class="modal-title">
                     <h1 class="text-center">注册</h1>
                 </div>
                 <div class="modal-body">
                     <form class="form-group" action="">
                             <div class="form-group">
                                 <label for="">用户名</label>
                                 <input class="form-control" type="text" placeholder="6-15位字母或数字">
                             </div>
                             <div class="form-group">
                                 <label for="">密码</label>
                                 <input class="form-control" type="password" placeholder="至少6位字母或数字">
                             </div>
                             <div class="form-group">
                                 <label for="">再次输入密码</label>
                                 <input class="form-control" type="password" placeholder="至少6位字母或数字">
                             </div>
                             <div class="form-group">
                                 <label for="">邮箱</label>
                                 <input class="form-control" type="email" placeholder="例如:123@123.com">
                             </div>
                             <div class="text-right">
                                 <button class="btn btn-primary" type="submit">提交</button>
                                 <button class="btn btn-danger" data-dismiss="modal">取消</button>
                             </div>
                             <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                     </form>
                 </div>
             </div>
         </div>
     </div>
     <!-- 登录窗口 -->
      <div id="login" class="modal fade" style="margin-top:60px;">
          <div class="modal-dialog">
              <div class="modal-content">
                  <div class="modal-body">
                      <button class="close" data-dismiss="modal">
                          <span>&times;</span>
                      </button>
                  </div>
                  <div class="modal-title">
                      <h1 class="text-center">登录</h1>
                  </div>
                  <div class="modal-body">
                      <form class="form-group" action="">
                              <div class="form-group">
                                  <label for="">用户名</label>
                                  <input class="form-control" type="text" placeholder="">
                              </div>
                              <div class="form-group">
                                  <label for="">密码</label>
                                  <input class="form-control" type="password" placeholder="">
                              </div>
                              <div class="text-right">
                                  <button class="btn btn-primary" type="submit">登录</button>
                                  <button class="btn btn-danger" data-dismiss="modal">取消</button>
                             </div>
                             <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                     </form>
                 </div>
             </div>
         </div>
     </div>
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>