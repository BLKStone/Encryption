<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>批量加密</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="Styles/skins/Aqua/css/ligerui-all.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/ligerResizable.js"></script>
<script type="text/javascript" src="js/ligerGrid.js"></script>
<script type="text/javascript" src="js/ligerToolBar.js"></script>
<script type="text/javascript" src="js/ligerui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript">
	var rootpath = "Styles/skins/Aqua/icons/";

	var data = {
		Rows : [ {
			name : "admin",
			password : "admin"
		}, {
			userName : "zhang",
			password : "zhang"
		} ]
	};

	function listToolbar() {
		var items = [];
		items.push({
			text : '增加',
			click : grid_add,
			img : rootpath + "add.gif"
		});
		items.push({
			text : '修改',
			click : grid_edit,
			img : rootpath + "edit.gif"
		});
		items.push({
			text : '删除',
			click : grid_delete,
			img : rootpath + "delete.gif"
		});
		return {
			items : items
		};
	}
	var isAdd;
	//add function
	function grid_add() {
		isAdd = true;
		var row = {
				userName : null,
				password: null
		};
		showDetail(row);
	}
	//edit function
	function grid_edit() {
		isAdd = false;
		var row = fileTable.getSelectedRow();
		if (!row) {
			$.ligerDialog.warn('请选择要操作的行！')
			return;
		}
		showDetail(row);
	}
	//delete function
	function grid_delete() {
		var row = fileTable.getSelectedRow();
		if (!row) {
			$.ligerDialog.warn('请选择要操作的行！')
			return;
		}
	}

	function showDetail(row, action) {
		var userForm = $("#userForm").ligerForm({
			inputWidth : 200,
			labelWidth : 90,
			space : 20,
			fields : [ {
				display : "用户名",
				name : "userName",
				newline : true,
				type : "text",
				validate : {
					required : true
				}
			}, {
				display : "密码",
				name : "password",
				newline : true,
				type : "text",
				validate : {
					required : true
				}
			} ]
		});
		var title1;
		if (isAdd) {
			title1 = '增加用户';	
		} else {
			title1 = '修改用户';
		}
		common.loadForm(userForm, row);
		$.ligerDialog.open({
			title : title1,
			target : $("#userForm"),
			width : 400,
			height : 120,
			isResize : false,
			buttons : [{
				text : '确定',
				onclick : function(item, dialog) {
					var userName = $("#userName").val();
					var password = $("#password").val();
					if (isAdd) {
						common.tip('录入成功！');
					} else {
						common.tip('修改成功！');
					}
					dialog.hide();
				}
			}, {
				text : '关闭',
				onclick : function(item, dialog) {
					dialog.hide();
				}
			} ]
		});

	}
	var fileTable = null;
	$(function() {
		refreshTable();
		fileTable = $("#fileTable").ligerGrid({
			columns : [ {
				display : '用户名',
				name : 'userName',
				width : '50%'
			}, {
				display : '密码',
				name : 'password',
				width : '50%'
			} ],
			toolbar : listToolbar(),
			pageSize : 10,
			checkbox : false,
			rownumbers : false,
			where : f_getWhere(),
			data : $.extend(true, {}, data),
			width : '68%',
			height : '90%'
		});
	});

	$(document).ready(function() {
		$("#bb").click(function() {
			var from = $("#from").val();
			var to = $("#to").val();
			if (from == '') {
				alert("请选择源路径!");
				return;
			}
			;
			if (to == '') {
				alert("请选择目标路径!");
				return;
			}
			;

			$.ajax({
				type : 'POST',
				url : "ribao!ribaoMET.action",
				data : {
					"cong" : cong,
					"dao" : dao
				},
				datatype : "json",
				cache : false,
				beforeSend : function() {
					common.loading = true;
					common.showLoading("数据获取中...");
				},
				complete : function() {
					common.loading = false;
					common.hideLoading();
				},
				success : function(json1) {
					var json = JSON2.parse(json1);
				}
			})
		});
	});
	// refresh table function
	function refreshTable(){
		
		
		console.log(data);
	}
	//search function
	function f_search() {
		fileTable.options.data = $.extend(true, {}, data);
		fileTable.loadData(f_getWhere());
	}
	function f_getWhere() {
		if (!fileTable)
			return null;
		var clause = function(rowdata, rowindex) {
			var key = $("#txtUserName").val();
			return rowdata.userName.indexOf(key) > -1;
		};
		return clause;
	}
</script>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="org.apache.commons.logging.Log,org.apache.commons.logging.LogFactory"%>
<%@ page import="cn.com.sgcc.db.*"%>
<%@ page import="cn.com.sgcc.dao.*"%>
<%@ page import="cn.com.sgcc.vo.*"%>
<%! Log logger = LogFactory.getLog("用户管理"); %>
<%! DatabaseLayer databaseLayer;%>
<% out.println(databaseLayer.getResourceDao()); %>
<%! Object[] refreshList()
{
	Object[] users = null;
	try
	{
		users = databaseLayer.getUserDao().selectAll().toArray();
	}
	catch (DaoException e)
	{
		logger.error("", e);
	}
	return users;
}
%>
<%! void delete(User user)
{
	try
	{
		databaseLayer.getUserDao().delete(user.getId());
	}
	catch (DaoException e)
	{
		logger.error("", e);
	}
}
%>
<%! void add(String u, String p)
{
	User user = new User();
	user.setName(u);
	user.setPassword(p);
	try
	{
		databaseLayer.getUserDao().insert(user);
	}
	catch (DaoException e)
	{
		logger.error("", e);
	}
}
%>
<%! void edit(String u, String p)
{
	User user = new User();
	user.setName(u);
	user.setPassword(p);
	try
	{
		databaseLayer.getUserDao().update(user);
	}
	catch (DaoException e)
	{
		logger.error("", e);
	}
}
%>
<style>
.my-button {
	background: #E0EDFF url(../images/controls/button-bg.gif) repeat-x
		center;
	cursor: pointer;
	border: solid 1px #A3C0E8
}
</style>
</head>
<body style="padding: 6px; overflow: hidden">
	<div id="searchbar" style="margin: 10px 0 5px 10px">
		<label style="width: 65px; display: inline-block">用户名：</label> <input
			id="txtUserName" type="text" class="l-text">
		<button class="my-button" id="btnSearch" onclick="f_search()"
			style="dispaly: inline">搜索</button>
	</div>
	<!-- <div id="toptoolbar"></div> -->
	<div id="fileTable"></div>
	<div id="userForm"></div>
</body>
</html>