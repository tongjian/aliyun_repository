<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Excel配置列表</title>
</head>
<body>
	<form id="excelConfigList_queryForm" role="form" class="form-horizontal" action="">
         <div class="form-group">
	         <div class="col-sm-4">
	            <label for="excelFileCode" class="control-label col-sm-4">Excel文件:</label>
	            <div class="col-sm-7">
	           		<select id="excelConfigList_queryParam_excelFileCode" class="form-control">
				    	<option value="1">用户基础数据</option>
				    </select>
	            </div>
	         </div>
         </div>
	</form>
	
	<div id="excelConfigList_toolbar" >
		<button class="btn btn-success btn-sm" onclick="excelConfigList_search()">
		    <i class="glyphicon glyphicon-search"></i> 查询
		</button>
		<button class="btn btn-success btn-sm" onclick="excelConfigList_add()">
		    <i class="glyphicon glyphicon-plus"></i> 新增
		</button>
	</div>
	
	<!-- 用户列表 -->
	<table id="excelConfigList_table"
		data-toolbar="#excelConfigList_toolbar"
		data-toolbar-align="right"
		data-query-params="excelConfigQueryParams"
		data-url="<%=contextPath%>/excelConfig/selectByPage"
		data-toggle="table"
		data-pagination="true"
		data-side-pagination="server"
		data-page-list="[10, 20, 50]">
		<thead>
		    <tr>
		        <th data-field="" data-checkbox="true"></th>
		        <th data-field="excelFileCode" data-align="center" data-sortable="true">Excel文件</th>
		        <th data-field="titleCode" data-align="center" data-sortable="true">列编码</th>
		        <th data-field="titleName" data-align="center" data-sortable="true">列名称</th>
		        <th data-field="dataType" data-align="center" data-sortable="true" 
		        	data-formatter="dateTypeFormatter">数据类型</th>
		        <th data-field="dataFormat" data-align="center" data-sortable="true">数据格式</th>
		        <th data-field="exportFlag" data-align="center" data-sortable="true"
		        	data-formatter="flagFormatter">是否导出</th>
		        <th data-field="importFlag" data-align="center" data-sortable="true"
		        	data-formatter="flagFormatter">是否导入</th>
		        <th data-field="titleIndex" data-align="center" data-sortable="true">列索引</th>
		        <th data-field="id" data-align="center" data-sortable="true"
		        	data-formatter="excelConfigListOperateFormatter">操作</th>
		    </tr>
	    </thead>
	</table>

	<!-- Excel配置编辑模态框 -->
    <div id="excelConfigList_modal" class="modal fade" data-backdrop="false" style="margin-top:60px;">
        <div class="modal-dialog" style="width:60%;">
            <div class="modal-content">
                <div class="modal-title">
                    <h2 id="excelConfigList_modal_title" class="text-center">Excel配置编辑</h2>
                </div>
                <div class="modal-body">
                    <form id="excelConfigList_form" role="form" class="form-group form-horizontal" action="">
						<div class="form-group">
							<input id="excelConfigList_id" name="id" type="hidden">
						    <label class="control-label col-sm-2">Excel文件:</label>
						    <div class="col-sm-4">
						        <select id="excelConfigList_excelFileCode" name="excelFileCode" class="form-control">
							    	<option value="userinfo">用户基础数据</option>
							    </select>
						    </div>
						    <label class="control-label col-sm-2">列索引:</label>
						    <div class="col-sm-4">
						        <input id="excelConfigList_titleIndex" name="titleIndex" class="form-control" type="text" />
						    </div>
						</div>
						<div class="form-group">
						    <label class="control-label col-sm-2">列编码:</label>
						    <div class="col-sm-4">
						        <input id="excelConfigList_titleCode" name="titleCode" class="form-control" type="text" />
						    </div>
						    <label class="control-label col-sm-2">列名称:</label>
						    <div class="col-sm-4">
						        <input id="excelConfigList_titleName" name="titleName" class="form-control" type="text" />
						    </div>
						</div>
						<div class="form-group">
						    <label class="control-label col-sm-2">数据类型:</label>
						    <div class="col-sm-4">
						    	<select id="excelConfigList_dataType" name="dataType" class="form-control">
							    	<option value="1">字符串</option>
							    	<option value="2">数字</option>
							    	<option value="3">日期</option>
							    </select>
						    </div>
						    <label class="control-label col-sm-2">数据格式:</label>
						    <div class="col-sm-4">
								<input id="excelConfigList_dataFormat" name="dataFormat" type="text" class="form-control">
						    </div>
						</div>
						<div class="form-group">
						    <label class="control-label col-sm-2">是否导入:</label>
						    <div class="col-sm-4">
						        <select id="excelConfigList_importFlag" name="importFlag" class="form-control">
							    	<option value="0">是</option>
							    	<option value="1">否</option>
							    </select>
						    </div>
						    <label class="control-label col-sm-2">是否导出:</label>
						    <div class="col-sm-4">
						        <select id="excelConfigList_exportFlag" name="exportFlag" class="form-control">
							    	<option value="0">是</option>
							    	<option value="1">否</option>
							    </select>
						    </div>
						</div>
						<div class="form-group">
						    <div class="col-sm-offset-5 col-sm-4">
						        <button type="button" onclick="excelConfigList_save()" class="btn btn-success btn-default">保存</button>
						        <button class="btn btn-danger" data-dismiss="modal">取消</button>
						    </div>
						</div>
					</form>
	              </div>
           </div>
       </div>
   </div>

<script src="<%=contextPath %>/js/jquery-1.12.4.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>				
<script src="<%=contextPath %>/js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/js/bootstrap-datepicker.min.js"></script>
<script src="<%=contextPath %>/js/bootstrap-datepicker-master/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="<%=contextPath %>/js/bootstrapvalidator-0.4.5/dist/js/bootstrapValidator.js"></script>	
<script src="<%=contextPath %>/js/common.js"></script>
<script src="<%=contextPath %>/js/util.js"></script>
<script type="text/javascript">

/* 数据类型格式化输出 */
function dateTypeFormatter(value,row,index){
	if(value == 1){
		return "字符串";
	}else if(value == 2){
		return "数字";
	}if(value == 3){
		return "日期";
	}
}

/* 是否导入导出 */
function flagFormatter(value,row,index){
	if(value == 0){
		return "是";
	}else{
		return "否";
	}
}

/* 格式化'操作'列 */
function excelConfigListOperateFormatter(value,row,index){
	var jsonRow = JSON.stringify(row);
	return '<button type="button" onclick="excelConfigList_editExcelConfig(\''+escape(jsonRow)+'\',\''+index+'\')" class="btn btn-primary btn-xs">修改</button>&nbsp;'+
			'<button type="button" onclick="excelConfigList_deleteExcelConfig('+value+')" class="btn btn-danger btn-xs">删除</button>';
}

function excelConfigList_editExcelConfig(jsonRow,index){
	var row = JSON.parse(unescape(jsonRow));		//先解码，再解析成json对象
	$("#excelConfigList_modal_title").text("修改Excel配置");
	$("#excelConfigList_modal").modal('show');
	$("#excelConfigList_form")[0].reset();
	
	/* 初始化角色信息 */
	util_excelConfig_setFormData('excelConfigList',row);
}

//删除用户
function excelConfigList_deleteExcelConfig(id){
	BootstrapDialog.confirm({
        title: '提示信息',
        message: '确定删除?',
        btnCancelLabel: '取消', // <-- Default value is 'Cancel',
        btnOKLabel: '确定', // <-- Default value is 'OK',
        callback: function(result) {
            if(result) {
            	$.ajax({
            		url:'<%=contextPath %>/excelConfig/deleteById',
            		data:{
            			'id' : id
            		},
            		success:function(resultObj){
            			BootstrapDialog.show({
            				title:'提示信息',
            				message:resultObj.resultMessage,
            				closable: false,		//不能自动关闭
            				buttons:[{
            					label:'确定',
            					action:function(dialog){
            						dialog.close();
            						if(resultObj.resultCode == "success"){
            							$("#excelConfigList_table").bootstrapTable('refresh');
            						}
            					}
            				}]
            			});
            		}
            	});
            }
        }
    });
}

/* 查询 */
function excelConfigList_search(){
	$("#excelConfigList_table").bootstrapTable('refresh');
}

/* 添加查询参数 */
function excelConfigQueryParams(params){
	params.excelFileCode = $("#excelConfigList_queryParam_excelFileCode").val();
	return params;
}

/* 保存 */
function excelConfigList_save(){
	//$("#excelConfigList_form").data("bootstrapValidator").validate();
	//var flag = $("#excelConfigList_form").data("bootstrapValidator").isValid();
	var flag = true;		//先省略验证
	if(flag){
		util_form_save('excelConfigList','<%=contextPath%>/excelConfig/save',util_excelConfig_getFormData("excelConfigList"),'modal');
	}
}

/**
 * @param 导出excel
 */
function excelConfigList_add(){
	$("#excelConfigList_modal_title").text("新增Excel配置");
	$("#excelConfigList_modal").modal('show');
	$("#excelConfigList_form")[0].reset();
	$("#excelConfigList_id").val("");		//清空id 
}
</script>
</body>
</html>