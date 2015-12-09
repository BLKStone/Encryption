<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
	
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="Styles/jquery-ui-1.8.21.custom.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="js/jquery-ui-1.8.21.custom.min.js" type="text/javascript"></script>
    <script src="js/login.js" type="text/javascript"></script>
		<title>瑞慈体检系统 </title>
		
	</head>
	
	<body>
	
    </div>
		<div id="loginDialog" title="登录">
			<s:form action="login" method="post" theme="simple">
				<table border="0" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>用户名：</td>
						<td><input type="text" id="username" name="user.userName"/></td>
					</tr>
					<tr>
						<td>密码：</td>
						<td><input type="password"  id="password" name="user.password"/></td>
					</tr>
					<tr>
						<td colspan="80"><input type="submit" id="login" value="登录"/></td>
					</tr>
				</table>
			</s:form>
		</div>
	</body>
</html>