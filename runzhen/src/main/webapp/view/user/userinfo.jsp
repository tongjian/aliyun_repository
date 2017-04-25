<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
<link rel="stylesheet" href="../js/bootstrap-datepicker-master/dist/css/bootstrap-datepicker.min.css">
</head>
<body>
<div class="form-horizontal">
	<div class="form-group">
		<input id="userCode_hidden" type="hidden" value="${sessionScope.userId}">
	    <label class="control-label col-sm-2">用户名:</label>
	    <div class="col-sm-3">
	        <input id="userCode" class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-2">中文名:</label>
	    <div class="col-sm-3">
	        <input id="userName" class="form-control" type="text" />
	    </div>
	</div>
	<div class="form-group">
	    <label class="control-label col-sm-2">手机号:</label>
	    <div class="col-sm-3">
	        <input id="phoneNumber" class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-2">QQ:</label>
	    <div class="col-sm-3">
	        <input id="qq" class="form-control" type="text" />
	    </div>
	</div>
	<div class="form-group">
	    <label class="control-label col-sm-2">邮箱:</label>
	    <div class="col-sm-3">
	        <input id="email" class="form-control" type="text" />
	    </div>
	     <label class="control-label col-sm-2">地址:</label>
	    <div class="col-sm-3">
	        <input id="address" class="form-control" type="text" />
	    </div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">出生日期:</label>
	    <div class="col-sm-3">
	    	<!-- <div id="birthDate" class="input-append date form_datetime">
			    <input size="16" type="text" value="" readonly>
			    <span class="add-on"><i class="icon-th"></i></span>
			    <span class="add-on"><i class="icon-remove"></i></span>
   				<span class="add-on"><i class="icon-calendar"></i></span>
			</div> -->
			<div class="input-group date">
			    <input id="birthDate" type="text" class="form-control">
			    <div class="input-group-addon">
			        <span class="glyphicon glyphicon-th"></span>
			    </div>
			</div>
	        <!-- <input id="birthDate" class="form-datetime" type="text" readonly /> -->
	    </div>
	</div>
	
	<div class="form-group">
	    <label class="control-label col-sm-2">性别:</label>
	    <div class="col-sm-3">
	        <select id="sex" class="form-control">
		    	<option value="">男</option>
		    	<option value="">女</option>
		    </select>
	    </div>
	    <label class="control-label col-sm-2">是否有效:</label>
	    <div class="col-sm-3">
	        <select id="active" class="form-control">
		    	<option value="">是</option>
		    	<option value="">否</option>
		    </select>
	    </div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">说明:</label>
		 <div class="col-sm-5">
	        <textarea id="remark" class="form-control" rows="3" ></textarea>
	    </div>
	</div>
	
	<div class="form-group">
	    <div class="col-sm-offset-5 col-sm-6">
	        <button type="button" class="btn btn-success btn-default">保存</button>
	    </div>
	</div>
</div>

<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../js/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
<script src="../js/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
$( function() {
  /*   $("#birthDate").datepicker(); */
	$('#birthDate').datepicker({
		language: "zh-CN",
	    autoclose: true,//选中之后自动隐藏日期选择框
	    clearBtn: true,//清除按钮
	    todayBtn: true,//今日按钮
	    format: "yyyy-mm-dd"//日期格式
	});
 } );
/* $("#birthDate").datepicker({
	format: 'yyyy-mm-dd',
	autoclose: true,
    todayBtn: true,
    pickerPosition: "bottom-left"
}); */
</script>
</body>
</html>