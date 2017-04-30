/* 角色表单验证 */
function util_role_bootstrapValidator(formId){
	$('#'+formId+'_form').bootstrapValidator({
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
}

/* 用户表单验证 */
function util_user_bootstrapValidator(formId){
	$('#'+formId+'_form').bootstrapValidator({
		message : '用户输入信息验证不通过.',
		fields : {
			userCode : {
				validators : {
					notEmpty : {message : '用户编码不能为空.'},
					stringLength : {max:10,message : '用户编码长度不能超过10位.'},
					regexp : {regexp: /^[a-zA-z0-9]+$/,message : '用户编码必须由数字字母组成.'}
				}
			},
			userName : {
				validators : {
					notEmpty : {message : '用户名称不能为空.'},
					stringLength : {max:15,message : '用户名称长度不能超过15位.'},
					regexp : {
						regexp: /^[\u4e00-\u9fa5_a-zA-Z0-9]+$/,
						message : '用户名称必须由汉字数字字母组成.'
					}
				}
			},
			phoneNumber : {
				validators : {
					notEmpty : {message : '手机号不能为空.'},
					regexp : {
						regexp: /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/,
						message : '请输入有效手机号.'
					}
				}
			},
			email: {
			    validators: {
			        emailAddress: {message: '请输入正确的邮件地址如：123@qq.com'}
			    }
			},
			remark : {
				validators : {
					stringLength : {max:100,message : '说明长度不能超过100位.'},
					regexp : {
						regexp: /^[\u4e00-\u9fa5_a-zA-z0-9]+$/,
						message : '说明必须由汉字数字字母组成.'
					}
				}
			}
		}
	});
}

/* 给用户表单设置值 */
function util_user_setFormData(formId,data){
	$("#"+formId+"_userId").val(data.userId);					//用户Id
	$("#"+formId+"_userCode").val(data.userCode);				//用户编号
	$("#"+formId+"_userName").val(data.userName);				//用户中文名
	$("#"+formId+"_phoneNumber").val(data.phoneNumber);			//用户手机号
	$("#"+formId+"_qq").val(data.qq);							//用户QQ
	$("#"+formId+"_email").val(data.email);						//email
	$("#"+formId+"_birthDate").datepicker('setDate',new Date(data.birthDate));			//生日
	$("#"+formId+"_sex").val(data.sex);							//性别
	$("#"+formId+"_active").val(data.active);					//是否有效
	$("#"+formId+"_address").val(data.address);					//地址
	$("#"+formId+"_remark").val(data.remark);					//设置说明
}

/* 获取用户表单值,返回json对象 */
function util_user_getFormData(formId){
	var userForm = {};
	userForm.userId = $("#"+formId+"_userId").val(),
	userForm.userCode = $("#"+formId+"_userCode").val(),
	userForm.userName = $("#"+formId+"_userName").val(),
	userForm.phoneNumber = $("#"+formId+"_phoneNumber").val(),
	userForm.qq = $("#"+formId+"_qq").val(),
	userForm.email = $("#"+formId+"_email").val(),
	userForm.birthDate = $("#"+formId+"_birthDate").datepicker('getDate'),
	userForm.sex = $("#"+formId+"_sex").val(),
	userForm.active = $("#"+formId+"_active").val(),
	userForm.address = $("#"+formId+"_address").val(),
	userForm.remark = $("#"+formId+"_remark").val()
	
	return userForm;
}

/* 保存表单的方法 
 * pageId:页面Id
 * saveUrl:保存请求地址
 * formData:需要保存的数据，json格式
 * isModal:是否是模态框
 */
function util_form_save(pageId,saveUrl,formData,isModal){
	$("#"+pageId+"_form").data("bootstrapValidator").validate();
	var flag = $("#"+pageId+"_form").data("bootstrapValidator").isValid();
	if(flag){
		$.ajax({
			dataType:'json',
			type: "POST",
			url:saveUrl,
			data : formData,
			success:function(data){
				util_result_dialog(pageId,data,isModal);
			}
		});
	}
}

/* 针对模态模态窗口保存返回结果的处理 */
function util_result_dialog(pageId,resultObj,isModal){
	var dialogType ;
	if(resultObj.resultCode == 'success'){
		dialogType = BootstrapDialog.TYPE_SUCCESS;
		if(isModal == 'modal'){			//返回成功，则将模态框隐藏，否则，不隐藏
			$("#"+pageId+"_modal").modal('hide');
		}
	}else{
		dialogType = BootstrapDialog.TYPE_DANGER;
	}
	
	BootstrapDialog.show({
		type : dialogType,
		title : '提示信息',
		message : resultObj.resultMessage,
		closable : false,		//不能自动关闭
		buttons:[{
			label:'确定',
			action:function(dialog){
				if(isModal == 'modal'){
					dialog.close();
					$("#"+pageId+"_table").bootstrapTable('refresh');
				}else{
					location.reload();
				}
			}
		}]
	});
}

//页面超时，重新登录
function util_loginAgain(){
	BootstrapDialog.show({
		type:BootstrapDialog.TYPE_DANGER,
		title:'提示信息',
		message:'页面超时,请重新登录',
		closable: false,		//不能自动关闭
		buttons:[{
			label:'确定',
			action:function(dialog){
				location.href = "../common/forward?page=main";
			}
		}]
	});
}