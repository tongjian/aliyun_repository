// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
// 例子： 
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

/* 格式化日期输出 */
function common_dateFormatter(value,row,index){
	if(value != '' && value != undefined){
		return  new Date(value).format("yyyy-MM-dd hh:mm:ss");
	}
}

/* 默认格式化日期框 */
$('.datepicker').datepicker({
	language: "zh-CN",
    autoclose: true,		//选中之后自动隐藏日期选择框
    clearBtn: true,			//清除按钮
    todayBtn: 'linked',		//今日按钮
    format: "yyyy-mm-dd"	//日期格式
});

/* 格式化输出 */
function common_activeFormatter(value,row,index){
	return value == 'Y' ? "有效":"无效";
}

/* 获取所有角色 */
function common_getRoleList(){
	var rolesArray = new Array();
	if(rolesArray.length == 0){
		$.ajax({
			async: false,
			url:'../role/findAll',
			success:function(result){
				if(result.resultCode == 'success'){
					var roleList = result.resultObject;
					for(var i in roleList){
						var roleJson = {};
						roleJson.id = roleList[i].roleId;
						roleJson.text = roleList[i].roleName;
						rolesArray.push(roleJson);
					}
				}
			}
		});
	}
	
	return rolesArray;
}