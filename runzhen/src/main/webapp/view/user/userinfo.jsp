<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人信息</title>
</head>
<body>
<div class="form-horizontal">
	<div class="form-group">
		<input id="userCode_hidden" type="hidden" value="${sessionScope.userId}">
	    <label class="control-label col-sm-2">用户名:</label>
	    <div class="col-sm-2">
	        <input class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-1">中文名:</label>
	    <div class="col-sm-2">
	        <input class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-1">邮箱:</label>
	    <div class="col-sm-3">
	        <input class="form-control" type="text" />
	    </div>
	</div>
	<div class="form-group">
	    <label class="control-label col-sm-2">手机号:</label>
	    <div class="col-sm-2">
	        <input class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-1">QQ:</label>
	    <div class="col-sm-2">
	        <input class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-1">地址:</label>
	    <div class="col-sm-3">
	        <input class="form-control" type="text" />
	    </div>
	</div>
	<div class="form-group">
	    <label class="control-label col-sm-2">出生日期:</label>
	    <div class="col-sm-2">
	        <input class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-1">性别:</label>
	    <div class="col-sm-2">
	        <input class="form-control" type="text" />
	    </div>
	    <label class="control-label col-sm-1">是否有效:</label>
	    <div class="col-sm-3">
	        <input class="form-control" type="text" />
	    </div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">说明:</label>
		<div class="col-sm-2">
	        <input class="form-control" type="text" />
	    </div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2">说明:</label>
		 <div class="col-sm-5">
	        <textarea class="form-control" rows="3" ></textarea>
	    </div>
	</div>
	<!-- <div class="form-group">
	    <label class="control-label col-sm-1 sr-only">名称</label>
	    <div class="col-sm-5">
	        <div class="checkbox">
	            <label>
	                <input type="checkbox"> 请打勾
	            </label>
	        </div>
	    </div>
	</div> -->
	<div class="form-group">
	    <div class="col-sm-offset-5 col-sm-6">
	        <button type="button" class="btn btn-success btn-default">保存</button>
	    </div>
	</div>
</div>
</body>
</html>