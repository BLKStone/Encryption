<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>加密参数</title>
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

	var table = null;
	$(function() {
		table = $("#table").ligerGrid({
			columns : [ {
				display : '起始IP',
				name : 'fromIp',
				width : '50%'
			}, {
				display : '结束IP',
				name : 'toIp',
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

	var data = {
		Rows : [ {
			fromIp : "132.133.1.3",
			toIp : "132.133.2.5"
		}, {
			fromIp : "132.133.1.6",
			toIp : "132.133.2.99"
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
			fromIp : null,
			toIp : null
		};
		showDetail(row);
	}
	//edit function
	function grid_edit() {
		isAdd = false;
		var row = table.getSelectedRow();
		if (!row) {
			$.ligerDialog.warn('请选择要操作的行！')
			return;
		}
		showDetail(row);
	}
	//delete function
	function grid_delete() {
		var row = table.getSelectedRow();
		if (!row) {
			$.ligerDialog.warn('请选择要操作的行！')
			return;
		}
	}

	function showDetail(row, action) {
		var ipForm = $("#ipForm").ligerForm({
			inputWidth : 200,
			labelWidth : 90,
			space : 20,
			fields : [ {
				display : "起始IP",
				name : "fromIp",
				newline : true,
				type : "text",
				validate : {
					required : true
				}
			}, {
				display : "结束IP",
				name : "toIp",
				newline : true,
				type : "text",
				validate : {
					required : true
				}
			} ]
		});
		var title1;
		if (isAdd) {
			title1 = '增加IP';
		} else {
			title1 = '修改IP';
		}
		common.loadForm(ipForm, row);
		$.ligerDialog.open({
			title : title1,
			target : $("#ipForm"),
			width : 400,
			height : 120,
			isResize : false,
			buttons : [ {
				text : '确定',
				onclick : function(item, dialog) {
					var fromIp = $("#fromIp").val();
					var toIp = $("#toIp").val();
					if (isAdd) {
						xh = row["xh"];
						$.ajax({
							type : 'POST',
							url : "addjiesuan!addjiesuanMET.action",
							data : {
								"xh" : xh,
								"xstc" : xstc
							},
							datatype : "json",

							beforeSend : function() {
								common.loading = true;
								common.showLoading("正在录入...");
							},
							complete : function() {
								common.loading = false;
								common.hideLoading();
							},

							success : function(results) {
								show();
								common.tip('录入成功！');

							}
						});

					} else {
						xh = row["xh"];
						$.ajax({
							type : 'POST',
							url : "editjiesuan!editjiesuanMET.action",
							data : {
								"xh" : xh,
								"xstc" : xstc,
								"cwsh" : cwsh,
								"kp" : kp,
								"xcsktz" : xcsktz,
								"kptt" : kptt
							},
							datatype : "json",

							beforeSend : function() {
								common.loading = true;
								common.showLoading("正在修改...");
							},
							complete : function() {
								common.loading = false;
								common.hideLoading();
							},

							success : function(results) {
								show();
								common.tip('修改成功！');

							}
						});

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
	//search function
	function f_search() {
		table.options.data = $.extend(true, {}, data);
		table.loadData(f_getWhere());
	}
	function f_getWhere() {
		if (!table)
			return null;
		var clause = function(rowdata, rowindex) {
			var key = $("#txtfromIp").val();
			return rowdata.fromIp.indexOf(key) > -1;
		};
		return clause;
	}
</script>
<style>
.my-button {
	background: #E0EDFF url(../images/controls/button-bg.gif) repeat-x
		center;
	cursor: pointer;
	border: solid 1px #A3C0E8
}
.rightsPanel{
	width: 66%;
	padding:10px;
	border: solid 1px #A3C0E8
}
.checkBoxItem{
	width:220px;
	display:inline-block;
}
</style>
</head>
<body style="padding: 6px; overflow: hidden">
	<div id="rightsPanel" class="rightsPanel">
		<h3 style="margin-bottom:10px;">权限</h3>
		<div class="checkBoxItem">
			<label><input id="onlineDisplayCheckBox" type="checkbox" value="" />在线打开</label>
		</div>
		<div class="checkBoxItem">
			<label><input id="onlinePrintCheckBox" type="checkbox" value="" />在线打印</label> 
		</div>
		<div class="checkBoxItem">
			<label><input id="onlineCopyCheckBox" type="checkbox" value="" />在线复制</label>
		</div>
		<br>
		<div class="checkBoxItem">
			<label><input id="offlineDisplayCheckBox" type="checkbox" value="" />借阅打开</label>
		</div>
		<div class="checkBoxItem">
			<label>借阅打开时间</label>
			<input id="offlineDisplayDurationTextField" type="text" class="l-text" style="width:80px;">
		</div>
		<div class="checkBoxItem">
			<label>借阅打开次数</label>
			<input id="offlineDisplayCountTextField" type="text" class="l-text" style="width:80px;">
		</div>		
	</div>
	<div id="searchbar" style="margin: 20px 0 5px 10px">
		<label style="width: 65px; display: inline-block">起始IP：</label> 
		<input id="txtfromIp" type="text" class="l-text">
		<button class="my-button" id="btnSearch" onclick="f_search()"
			style="dispaly: inline">搜索</button>
	</div>
	<div id="table"></div>
	<div id="ipForm"></div>
</body>
</html>