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
<link href="js/bootstrapvalidator-0.4.5/dist/css/bootstrapValidator.min.css" rel="stylesheet">
<link href="js/bootstrap3-dialog-master/dist/css/bootstrap-dialog.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<!-- [if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body>
	
	<div class="navbar-wrapper">
		<div class="container">
			<nav class="navbar navbar-default navbar-inverse" role="navigation">
				<div class="container-fluid"> 
				    <div class="navbar-header">
				        <a class="navbar-brand" href="#">首页(作废)</a>
				    </div>
				    <div>
				    	<input id="userCode_hidden" type="hidden" value="${sessionScope.userCode}">
				        <!--向右对齐-->
				        <form class="navbar-form navbar-right" role="search">
				            <button id="login_button" type="button" class="btn btn-success" style="display:none;"
					    		data-toggle="modal" data-target="#login_modal" >登录</button>
					    	<button id="logout_button" type="button" class="btn btn-success" style="display:none;"
					    		onclick="logout_click()">注销</button>
				        </form>
				        <p id="userCode_p" class="navbar-text navbar-right" style="display:none;">
				        	<strong>用户名:</strong>&nbsp;<em>${sessionScope.userCode}</em>
				        </p>
				        <ul class="nav navbar-nav navbar-right">
				    		<li><a id="manage_a" href="common/forward?page=manage" style="display:none;"><strong>后台管理</strong></a></li>
				    	</ul>
				    </div>
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
     <div id="register_modal" class="modal fade" data-backdrop="false" tabindex="-1" style="margin-top:50px;">
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
                     <form id="register_form" role="form" class="form-group" action="">
                             <div class="form-group">
                                 <label for="userCode">用户名</label>
                                 <input name="userCode" class="form-control" type="text" placeholder="6-15位字母或数字">
                             </div>
                             <div class="form-group">
                                 <label for="password">密码</label>
                                 <input id="password" name="password" class="form-control" type="password" placeholder="至少6位字母或数字">
                             </div>
                             <div class="form-group">
                                 <label for="repassword">再次输入密码</label>
                                 <input name="repassword" class="form-control" type="password" placeholder="至少6位字母或数字" >
                             </div>
                             <div class="form-group">
                                 <label for="email">邮箱</label>
                                 <input name="email" class="form-control" type="email" placeholder="例如:123@123.com" >
                             </div>
                             <div class="text-right">
                                 <button class="btn btn-primary" type="button" onclick="register_click()">提交</button>
                                 <button class="btn btn-danger" data-dismiss="modal">取消</button>
                             </div>
                             <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                     </form>
                 </div>
             </div>
         </div>
     </div>
     <!-- 登录窗口 -->
      <div id="login_modal" class="modal fade" data-backdrop="false" style="margin-top:60px;">
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
                      <form id="login_form" role="form" class="form-group" action="">
                              <div class="form-group">
                                  <label for="userCode">用户名</label>
                                  <input name="userCode" class="form-control" type="text" placeholder="6-15位字母或数字">
                              </div>
                              <div class="form-group">
                                  <label for="password">密码</label>
                                  <input name="password" class="form-control" type="password" placeholder="至少6位字母或数字">
                              </div>
                              <div class="text-right">
                                  <button class="btn btn-primary" type="button" onclick="login_click()">登录</button>
                                  <button class="btn btn-danger" data-dismiss="modal">取消</button>
                             </div>
                             <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register_modal">还没有账号？点我注册</a>
                     </form>
                 </div>
             </div>
         </div>
     </div>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="js/bootstrap-validator-master/dist/validator.js"></script>
<script src="js/bootstrapvalidator-0.4.5/dist/js/bootstrapValidator.js"></script>
<script src="js/bootstrap3-dialog-master/dist/js/bootstrap-dialog.min.js"></script>
<script type="text/javascript">  
 /*   var types = [BootstrapDialog.TYPE_DEFAULT, 
                     BootstrapDialog.TYPE_INFO, 
                     BootstrapDialog.TYPE_PRIMARY, 
                     BootstrapDialog.TYPE_SUCCESS, 
                     BootstrapDialog.TYPE_WARNING, 
                     BootstrapDialog.TYPE_DANGER]; */
$(function(){
	var userCode = $("#userCode_hidden").val();
	if(userCode != '' && userCode != undefined){
		$("#login_button").css('display','none');
		$("#logout_button").css('display','block');
		$("#userCode_p").css('display','block');		//显示“用户名”
		$("#manage_a").css('display','block');			//显示“后台管理”导航
	}else{
		$("#login_button").css('display','block');		//
		$("#logout_button").css('display','none');
		$("#userCode_p").css('display','none');
	}
});

//注册验证
$('#register_form').bootstrapValidator({
	message : '表单验证不通过.',
	fields : {
		userCode : {
			message : '用户名验证不通过.',
			validators : {
				notEmpty : {
					message : '用户名不能为空.'
				},
				stringLength : {
					min:6,
					max:15,
					message : '用户名长度必须在6到15之间.'
				},
				regexp : {
					regexp: /^[a-zA-z0-9]+$/,
					message : '用户名必须由数字字母组成.'
				}
			}
		},
		password : {
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
				},
                different: {//不能和用户名相同
                    field: 'userCode',//需要进行比较的input name值
                    message: '不能和用户名相同'
                }
			}
		},
		repassword : {
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
				},
				identical: {//相同
				    field: 'password', //需要进行比较的input name值
				    message: '两次密码不一致'
				}
			}
		},
		email: {
		    validators: {
		        emailAddress: {
		            message: '请输入正确的邮件地址如：123@qq.com'
		        }
		    }
		}
	}
});

//登录验证
$('#login_form').bootstrapValidator({
	message : '表单验证不通过.',
	fields : {
		userCode : {
			message : '用户名验证不通过.',
			validators : {
				notEmpty : {
					message : '用户名不能为空.'
				},
				stringLength : {
					min:6,
					max:15,
					message : '用户名长度必须在6到15之间.'
				},
				regexp : {
					regexp: /^[a-zA-z0-9]+$/,
					message : '用户名必须由数字字母组成.'
				}
			}
		},
		password : {
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
		}
	}
});

//注册
function register_click(){
	$("#register_form").data("bootstrapValidator").validate();
	var flag = $("#register_form").data("bootstrapValidator").isValid();
	if(flag){
		$.ajax({
			dataType:'json',
			cache:false,
			url : 'user/register',
			data : $("#register_form").serializeArray(),
			success:function(result){
				$('#register_modal').modal('hide');
				BootstrapDialog.show({
					type:BootstrapDialog.TYPE_INFO,
					title:'提示信息',
					closable: false,		//不能自动关闭
					message:result.resultMessage,
					buttons:[{
						label:'确定',
						action:function(dialog){
							dialog.close();
						}
					}]
				});
			}
		});
	}
}

//登录
function login_click(){
	$("#login_form").data("bootstrapValidator").validate();
	var flag = $("#login_form").data("bootstrapValidator").isValid();
	if(flag){
		$.ajax({
			dataType:'json',
			cache:false,
			url : 'user/login',
			data : $("#login_form").serializeArray(),
			success:function(result){
				$('#login_modal').modal('hide');
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
								location.reload();
								/* location.href = "common/forward?page=manage"; */
							}
						}
					}]
				});
			}
		});
	}
}

//注销
function logout_click(){
	$.ajax({
		dataType:'json',
		cache:false,
		url : 'user/logout',
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
							location.reload();
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