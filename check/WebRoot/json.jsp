<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>显示学生信息</title>
		<script type="text/javascript" src="script/jquery-1.3.2.js"></script>
		<script type="text/javascript" src="script/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="script/jquery-1.3.2-vsdoc2.js"></script>
		<script type="text/javascript" src="script/jquery-1.5.js"></script>
		<script type="text/javascript" src="script/jquery_dialog.js"></script>
		<link rel="stylesheet" href="css/jquery_dialog.css" type="text/css"></link>
	<style type="text/css">
#dialog-overlay {  
width:100%;   
height:100%;  
filter:alpha(opacity=50);   
-moz-opacity:0.5;   
-khtml-opacity: 0.5;   
opacity: 0.5;   
position:absolute;   
background:#000;   
top:0; left:0;   
z-index:3000;   
display:none;  
} 
#dialog-box {  
-webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);  
-moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);  
-moz-border-radius: 5px;  
-webkit-border-radius: 5px;  
background:#FFFFCC;  
width:328px;   
position:absolute;   
z-index:5000;   
display:none;  
} 
#dialog-box .dialog-content {  
text-align:left;   
padding:10px;   
margin:13px;  
color:black;   
font-family:arial;  
font-size:11px;   
}  
a.button {  
margin:10px auto 0 auto;  
text-align:center;  
background-color: #e33100;  
display: block;  
width:50px;  
padding: 5px 10px 6px;  
color: #fff;  
text-decoration: none;  
font-weight: bold;  
line-height: 1;  
-moz-border-radius: 5px;  
-webkit-border-radius: 5px;  
-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);  
-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);  
text-shadow: 0 -1px 1px rgba(0,0,0,0.25);  
border-bottom: 1px solid rgba(0,0,0,0.25);  
position: relative;  
cursor: pointer;  
}  
a.button:hover {  
background-color: red;    
}
#dialog-box .dialog-content p {  
font-weight:700; margin:0;
} 
#dialog-box .dialog-content ul {  
margin:10px 0 10px 20px;   
padding:0;   
height:50px;  
}  
</style>  

	
	</head>
	<script type="text/javascript">
		function check(){
			$.ajax({
            url: "student!del.action",
            type: "post",
            data:({id:3}),
            cache: false,
            beforeSend: function(result) {
            },
            success: function(result) {
            	alert("删除成功！");
            },
            error: function(result, status) {
                if (status == 'error') {
                    alert("系统发生错误");
                }
            }
        });
		}
		function del(id){
			if(confirm("确定删除？")){
				$.ajax({
            url: "student!del.action",
            type: "post",
            data:({id:id}),
            cache: false,
            beforeSend: function(result) {
            },
            success: function(result) {
            	alert("删除成功！");
            },
            error: function(result, status) {
                if (status == 'error') {
                    alert("系统发生错误");
                }
            }
        });
			}
		}
		function queryById(id){
			$.ajax({
            url: "student!queryById.action",
            type: "post",
            data:({id:id}),
            cache: false,
            beforeSend: function(result) {
            },
            success: function(json) {
				var student = json.student;
				var html = '<center><h2>修改学生信息</h2></center><form name="f1"><table border="1" cellpadding="0" cellspacing="0">';
				html+='<tr><td>编号</td><td><input type="text" disabled="true" id="id" value="'+student.id+'"/></td></tr>'
				html+='<tr><td>姓名</td><td><input type="text" id="username" value="'+student.username+'"/></td></tr>';
				html+='<tr><td>学号</td><td><input type="text" id="stuid" value="'+student.stuid+'"/></td></tr>';
				html+='<tr><td>电话</td><td><input type="text" id="phone" value="'+student.phone+'"/></td></tr>';
				html+='<tr><td>地址</td><td><input type="text" id="address" value="'+student.address+'"/></td></tr>';
				html+='<tr><td>邮箱</td><td><input type="text" id="email" value="'+student.email+'"/></td></tr>';
				html += '<tr align="center"><td colspan="2"><input type="button" value="修改" onclick="update()"/><input type="button" value="取消" onclick="guanbi()"/></td></tr>';
				html+='</table></form>';
				
				var maskHeight = $(document).height();  
			var maskWidth = $(window).width();
			var dialogTop =  ((maskHeight) - ($('#dialog-box').height()))/2-130;  
			var dialogLeft = ((maskWidth) - ($('#dialog-box').width()))/2; 
			$('#dialog-overlay').css({height:maskHeight, width:maskWidth}).show();
			$('#dialog-box').css({top:dialogTop, left:dialogLeft}).show();
			$('#dialog-message').html(html);
            },
            error: function(result, status) {
                if (status == 'error') {
                    alert("系统发生错误");
                }
            }
        });
        }
        function update(){
        	var id = document.getElementById("id").value;
			var username = document.getElementById("username").value;
			var stuid = document.getElementById("stuid").value;
			var phone = document.getElementById("phone").value;
			var address = document.getElementById("address").value;
			var email = document.getElementById("email").value;
        	$.ajax({
            url: "student!change.action",
            type: "post",
            data: ({"id":id,"username":username,"stuid":stuid,"phone":phone,"address":address,"email":email}),
            cache: false,
            beforeSend: function(result) {
            },
            success: function(result) {
            	alert("更新成功!");
            	$('#dialog-overlay, #dialog-box').hide();
            },
            error: function(result, status) {
                if (status == 'error') {
                    alert("系统发生错误");
                }
            }
        });
        }
        function insert(){
			var html = '<center><h2>添加学生信息</h2></center><form name="f2"><table border="1" cellpadding="0" cellspacing="0">';
			html += '<tr><td>姓名</td><td><input type="text" id="username" name="username"/></td></tr>';
			html += '<tr><td>学号</td><td><input type="text" id="stuid" name="stuid"/></td></tr>';
			html += '<tr><td>电话</td><td><input type="text" id="phone" name="phone"/></td></tr>';
			html += '<tr><td>地址</td><td><input type="text" id="address" name="address"/></td></tr>';
			html += '<tr><td>邮箱</td><td><input type="text" id="email" name="email"/></td></tr>';
			html += '<tr align="center"><td colspan="2"><input type="button" value="增加" onclick="save()"/><input type="button" value="取消" onclick="guanbi()"/></td></tr>';
			html += '</table></form>';
			var maskHeight = $(document).height();  
			var maskWidth = $(window).width();
			var dialogTop =  ((maskHeight) - ($('#dialog-box').height()))/2-130;  
			var dialogLeft = ((maskWidth) - ($('#dialog-box').width()))/2; 
			$('#dialog-overlay').css({height:maskHeight, width:maskWidth}).show();
			$('#dialog-box').css({top:dialogTop, left:dialogLeft}).show();
			$('#dialog-message').html(html);
        }
        function guanbi(){
        	$('#dialog-overlay, #dialog-box').hide();
        }
        function save(){
			var username = document.getElementById("username").value;
			var stuid = document.getElementById("stuid").value;
			var phone = document.getElementById("phone").value;
			var address = document.getElementById("address").value;
			var email = document.getElementById("email").value;
        	$.ajax({
            url: "student!save.action",
            type: "post",
            data: ({"username":username,"stuid":stuid,"phone":phone,"address":address,"email":email}),
            cache: false,
            beforeSend: function(result) {
            },
            success: function(result) {
            	alert("增加成功!");
            	$('#dialog-overlay, #dialog-box').hide();
            },
            error: function(result, status) {
                if (status == 'error') {
                    alert("系统发生错误");
                }
            }
        });
        }
  </script>
	<body style="margin:0px;padding:0px;">
		<input type="button" value="查询" id="button" onclick="check()"/>
		<center>
			<form action="" method="post">
				<h2>学生信息显示</h2>
				<div id="result" align="center"/>
			</form>
		</center>
		<center>
<div id="dialog-overlay"></div>
<div id="dialog-box">
	<div class="dialog-content">
		<center>
		<div id="dialog-message"></div>
		</center>
	</div>
</div>
</center>
	</body>
</html>