<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>日报</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="Styles/skins/Aqua/css/ligerui-all.css" rel="stylesheet"
	type="text/css"/>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/ligerResizable.js"></script>
<script type="text/javascript" src="js/ligerGrid.js"></script>
<script type="text/javascript" src="js/ligerui.min.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript">
	var rootpath = "Styles/skins/Aqua/icons/";
	var data = {
		Rows : [ {
			fileName : "hello.jsp",
			isNotEncrypted : '否',
			isSuccessed : '是',
			isFailed : '否'
		}, {
			fileName : "我是.jsp",
			isNotEncrypted : '否',
			isSuccessed : '是',
			isFailed : '否'
		} ]
	};
	var fileTable = null;
	$(function() {
		fileTable = $("#fileTable").ligerGrid({
			columns : [ {
				display : '文件',
				name : 'fileName',
				width : '40%'
			}, {
				display : '待加密',
				name : 'isNotEncrypted',
				width : '20%'
			}, {
				display : '成功',
				name : 'isSuccessed',
				width : '20%'
			}, {
				display : '失败',
				name : 'isFailed',
				width : '20%'
			} ],
			pageSize : 10,
			checkbox : false,
			rownumbers : false,
			where : f_getWhere(),
			data : $.extend(true, {}, data),
			//data : data,
			width : '99%',
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
	//search function
	function f_search() {
		fileTable.options.data = $.extend(true, {}, data);
		fileTable.loadData(f_getWhere());
	}
	function f_getWhere() {
		if (!fileTable)
			return null;
		var clause = function(rowdata, rowindex) {
			var key = $("#txtFileName").val();
			return rowdata.fileName.indexOf(key) > -1;
		};
		return clause;
	}
	function chooseFile() {
		try {
	        var Message = "\u8bf7\u9009\u62e9\u6587\u4ef6\u5939"; //选择框提示信息
	        var Shell = new ActiveXObject("Shell.Application");
	        var Folder = Shell.BrowseForFolder(0, Message, 64, 17); //起始目录为：我的电脑
	        //var Folder = Shell.BrowseForFolder(0, Message, 0); //起始目录为：桌面
	        if (Folder != null) {
	            Folder = Folder.items(); // 返回 FolderItems 对象
	            Folder = Folder.item(); // 返回 Folderitem 对象
	            Folder = Folder.Path; // 返回路径
	            if (Folder.charAt(Folder.length - 1) != "\\") {
	                Folder = Folder + "\\";
	            }
	            document.getElementById(path).value = Folder;
	            return Folder;
	        }
	    }
	    catch (e) {
	        alert(e.message);
	    } 
		alert("hello");
	}
</script>
<style>
.my-button{
	background:#E0EDFF url(../images/controls/button-bg.gif) repeat-x center;
	cursor:pointer;
	border:solid 1px #A3C0E8
}
</style>
</head>
<body style="padding: 6px; overflow: hidden">
	<div style="margin:10px 0 0 10px">
		<div>
			<label style="width: 65px; display: inline-block">源路径:</label>
			<input type="text" id="from" style="width: 400px;" class="l-text">
			<button onclick="chooseFile()" class="my-button" style="margin:0px 0px 0px 10px;">选择</button>
		</div>
		<div style="margin:10px 0 0 0">
			<label style="width: 65px; display: inline-block">目标路径:</label>
			<input type="text" id="to" style="width: 400px;" class="l-text">
			<button on-click="chooseFile()" class="my-button" style="margin:0px 0px 0px 10px;">选择</button>
			<button on-click="chooseFile()" class="my-button" style="margin:0px 0px 0px 15px;">开始加密</button>
		</div>
	</div>
	<div id="searchbar" style="margin: 20px 0 5px 10px">
		<label style="width: 65px; display: inline-block">文件名：</label> 
		<input id="txtFileName" type="text" class="l-text">
		<button class="my-button" id="btnSearch" onclick="f_search()" style="dispaly:inline">搜索</button>
	</div>
	<div id="fileTable"></div>
</body>
</html>