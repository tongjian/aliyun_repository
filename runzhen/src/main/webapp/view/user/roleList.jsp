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
<link href="../js/bootstrapvalidator-0.4.5/dist/css/bootstrapValidator.min.css" rel="stylesheet">
</head>
<body>
	
    <form id="roleList_queryForm" role="form" class="form-horizontal" action="">
         <div class="form-group">
            <label for="roleCode" class="control-label col-sm-1">角色编码:</label>
            <div class="col-sm-2">
            	<input id="roleList_queryParam_roleCode" name="roleCode" class="form-control" type="text" >
            </div>
            <label for="roleName" class="control-label col-sm-1">角色名称</label>
            <div class="col-sm-2">
            	<input id="roleList_queryParam_roleName" name="roleName" class="form-control" type="text" >
            </div>
         	<label for="active" class="control-label col-sm-1">是否有效:</label>
         	<div class="col-sm-2">
				<select id="roleList_queryParam_active" name="active" class="form-control">
					<option value="">全部</option>
					<option value="Y" selected>是</option>
					<option value="N">否</option>
				</select>
             </div>
         </div>
	</form>
    
	<div id="roleList_toolbar" >
		<button id="roleList_append" class="btn btn-success btn-sm" onclick="roleList_append()">
		    <i class="glyphicon glyphicon-plus"></i> 新增
		</button>
		<button id="roleList_append" class="btn btn-success btn-sm" onclick="roleList_search()">
		    <i class="glyphicon glyphicon-search"></i> 查询
		</button>
	</div>
	<!-- 用户列表 -->
	<table id="roleList_table"
		data-toolbar="#roleList_toolbar"
		data-toolbar-align="right"
		data-query-params="roleList_queryParams"
		data-url="<%=contextPath%>/role/list"
		data-toggle="table"
		data-pagination="true"
		data-side-pagination="server"
		data-page-list="[5, 10, 20, 50]">
		<thead>
		    <tr>
		        <th data-field="" data-checkbox="true"></th>
		        <th data-field="roleCode" data-align="center" data-sortable="true">角色编码</th>
		        <th data-field="roleName" data-align="center" data-sortable="true">角色名称</th>
		        <th data-field="createDate" data-align="center" data-sortable="true" 
		        	data-formatter="common_dateFormatter">创建日期</th>
		        <th data-field="active" data-align="center" data-sortable="true"
		        	data-formatter="common_activeFormatter">是否有效</th>
		        <th data-field="remark" data-align="center" data-sortable="true">说明</th>
		        <th data-field="roleId" data-align="center" data-sortable="true"
		        	data-formatter="roleList_operateFormatter">操作</th>
		    </tr>
	    </thead>
	</table>
	
	
	<!-- 登录窗口 -->
    <div id="roleList_modal" class="modal fade" data-backdrop="false" style="margin-top:60px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-title">
                    <h2 id="roleList_modal_title" class="text-center">新增角色</h2>
                </div>
                <div class="modal-body">
                    <form id="roleList_form" role="form" class="form-group" action="">
                            <div class="form-group">
                                <label for="roleCode">角色编码</label>
                                <input id="roleList_roleCode" name="roleCode" class="form-control" type="text" placeholder="不超过10位字母或数字">
                                <input id="roleList_roleId" type="hidden" name="roleId" >
                            </div>
                            <div class="form-group">
                                <label for="roleName">角色名称</label>
                                <input id="roleList_roleName" name="roleName" class="form-control" type="text" placeholder="角色名称由汉字、数字、字母组成">
                            </div>
                            <div class="form-group">
                                <label for="active">是否有效:</label>
						        <select id="roleList_active" name="active" class="form-control">
							    	<option value="Y" selected>是</option>
							    	<option value="N">否</option>
							    </select>
                            </div>
                            <div class="form-group">
								<label for="remark">说明:</label>
						        <textarea id="roleList_remark" name="remark" class="form-control" rows="3" ></textarea>
							</div>
							<div class="text-center">
                                <button class="btn btn-success" type="button" onclick="roleList_save()">保存</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
							</div>
	                  </form>
	              </div>
           </div>
       </div>
   </div>
  
<script src="../js/jquery-1.12.4.min.js"></script>
<script src="../js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table-develop/dist/bootstrap-table.min.js"></script>
<script src="../js/bootstrap-table-develop/dist/locale/bootstrap-table-zh-CN.js"></script>
<script src="../js/bootstrapvalidator-0.4.5/dist/js/bootstrapValidator.js"></script>
<script src="../js/json2.js"></script>
<script src="../js/common.js"></script>
<script type="text/javascript">
//登录验证
$('#roleList_form').bootstrapValidator({
	message : '角色输入信息验证不通过.',
	fields : {
		roleCode : {
			validators : {
				notEmpty : {
					message : '角色编码不能为空.'
				},
				stringLength : {
					max:10,
					message : '角色编码长度不能超过10位.'
				},
				regexp : {
					regexp: /^[a-zA-z0-9]+$/,
					message : '角色编码必须由数字字母组成.'
				}
			}
		},
		roleName : {
			validators : {
				notEmpty : {
					message : '角色名称不能为空.'
				},
				stringLength : {
					max:15,
					message : '角色名称长度不能超过15位.'
				},
				regexp : {
					regexp: /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/,
					message : '角色名称必须由汉子数字字母组成.'
				}
			}
		},
		remark : {
			validators : {
				stringLength : {
					max:100,
					message : '说明长度不能超过100位.'
				},
				regexp : {
					regexp: /^[\u4e00-\u9fa5_a-zA-z0-9]+$/,
					message : '说明必须由汉子数字字母组成.'
				}
			}
		}
	}
});


/* 新增角色 */
function roleList_append(){
	$("#roleList_modal_title").text("新增角色");
	$("#roleList_modal").modal('show');
	$("#roleList_form")[0].reset();				//重置表单
	$("#roleList_roleId").val('');				//清除隐藏域的值
}

/* 保存 */
function roleList_save(){
	$("#roleList_form").data("bootstrapValidator").validate();
	var flag = $("#roleList_form").data("bootstrapValidator").isValid();
	if(flag){
		$.ajax({
			dataType:'json',
			url:'<%=contextPath%>/role/save',
			data:$("#roleList_form").serializeArray(),
			success:function(result){
				$('#roleList_modal').modal('hide');
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
								$("#roleList_table").bootstrapTable('refresh');
							}
						}
					}]
				});
			}
		});
	}
}

/* 格式化'操作'列 */
function roleList_operateFormatter(value,row,index){
	var jsonRow = JSON.stringify(row);
	return '<button type="button" onclick="roleList_editRole(\''+escape(jsonRow)+'\',\''+index+'\')" class="btn btn-primary btn-xs">修改</button>&nbsp;'+
			'<button type="button" onclick="" class="btn btn-danger btn-xs">删除</button>';
}

/* 修改角色信息 */
function roleList_editRole(jsonRow,index){
	var row = JSON.parse(unescape(jsonRow));		//先解码，再解析成json对象
	$("#roleList_modal_title").text("修改角色");
	$("#roleList_modal").modal('show');
	$("#roleList_form")[0].reset();
	
	/* 初始化角色信息 */
	$("#roleList_roleId").val(row.roleId);
	$("#roleList_roleCode").val(row.roleCode);
	$("#roleList_roleName").val(row.roleName);
	$("#roleList_active").val(row.active);
	$("#roleList_remark").val(row.remark);
}

/* 查询 */
function roleList_search(){
	$("#roleList_table").bootstrapTable('refresh');
}

/* 添加查询参数 */
function roleList_queryParams(params){
	params.active = $("#roleList_queryParam_active").val();
	params.roleCode = $("#roleList_queryParam_roleCode").val();
	params.roleName = $("#roleList_queryParam_roleName").val();
	return params;
}

</script>
</body>
</html>