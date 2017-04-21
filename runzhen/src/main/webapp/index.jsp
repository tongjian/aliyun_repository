<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>首页</title>
<link rel="icon" href="image/favicon.ico">
<link href="js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<style>
</style>
<!-- [if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<div class="navbar-wrapper">
		<div class="container">
			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" 
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span>	
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#">Project name</a>
					</div>
					<div id="navbar" class="collapse navbar-collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">Home</a></li>
							<li><a href="#about">About</a></li>
							<li><a href="#contact">Contact</a></li>
							<li class="dropdown">
			                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
			                  aria-haspopup="true" aria-expanded="false">
			                  		Dropdown <span class="caret"></span>
			                  </a>
			                  <ul class="dropdown-menu">
			                    <li><a href="#">Action</a></li>
			                    <li><a href="#">Another action</a></li>
			                    <li><a href="#">Something else here</a></li>
			                    <li role="separator" class="divider"></li>
			                    <li class="dropdown-header">Nav header</li>
			                    <li><a href="#">Separated link</a></li>
			                    <li><a href="#">One more separated link</a></li>
			                  </ul>
			                </li>
						</ul>
						
						<div class="navbar-form navbar-right">
							<button type="button" class="btn btn-success" 
						    data-toggle="modal" data-target="#login" >登录</button>
						</div>
					</div><!-- /.nav-collapse -->
				</div>
			</nav>
		</div>
	</div>
	
	 <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item active">
        	<img src="image/slide-01.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
        	<img src="image/slide-02.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
        	<img src="image/slide-03.jpg" alt="">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
    
    <div class="container marketing">
    	<!-- Three columns of text below the carousel -->
	    <div class="row">
	      <div class="col-lg-4">
	        <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
	        <h2>Heading</h2>
	        <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna.</p>
	        <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-lg-4">
	        <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
	        <h2>Heading</h2>
	        <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh.</p>
	        <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	      </div><!-- /.col-lg-4 -->
	      <div class="col-lg-4">
	        <img class="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="140" height="140">
	        <h2>Heading</h2>
	        <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
	        <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
    
    	 <hr class="featurette-divider">
    	
    	<!-- FOOTER -->
	    <footer>
	      <p class="pull-right"><a href="#">Back to top</a></p>
	      <p>&copy; 2016 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
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
                     <form id="register_form" data-toggle="validator" role="form" class="form-group" action="user/register">
                             <div class="form-group">
                                 <label for="userCode">用户名</label>
                                 <input name="userCode" class="form-control" type="text" data-minlength="6" maxlength="15"
                                 	placeholder="6-15位字母或数字" required>
                             </div>
                             <div class="form-group">
                                 <label for="password">密码</label>
                                 <input id="password" name="password" class="form-control" type="password" data-minlength="6"
                                 	placeholder="至少6位字母或数字" required>
                             </div>
                             <div class="form-group">
                                 <label for="repeatPassword">再次输入密码</label>
                                 <input name="repeatPassword" class="form-control" type="password" data-match-error="两次输入密码不一致"
                                 	placeholder="至少6位字母或数字" data-match="#password" required>
                             </div>
                             <div class="form-group">
                                 <label for="email">邮箱</label>
                                 <input name="email" class="form-control" type="email" 
                                 	placeholder="例如:123@123.com" data-error="请输入正确的邮箱.">
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
<script src="js/jquery-3.2.1.js"></script>
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="js/bootstrap-validator-master/dist/validator.js"></script>
<script type="text/javascript">  
$('#register_form').validator().on('submit', function (e) {
	if (e.isDefaultPrevented()) {
	  // handle the invalid form...
		alert(1);
	} else {
	  // everything looks good!
		alert(2);
	}
});
</script>  
</body>
</html>