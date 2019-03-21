<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>


<!-- 网页样式 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 标题及样式引用 -->
<head>
<meta charset="utf-8">
<title>注册Contact管理系统账户</title>
<link rel="stylesheet" type="text/css" href="css/login.css" />
<link rel="stylesheet" type="text/css" href="css/register.css" />

</head>

<body>
<div class="contain"> <!-- 最外层模块 -->
<div class="main"> <!-- 主要界面 -->
	<div class="top-box">
	<a id="s-login-logo"class="navbar-brand" href="index.jsp">Contact管理-主页</a>
	</div> <!-- 底层上部背景 -->
	<div class="page-header" id="s-main-header">
		<h1 style="font-size: 36px;font-weight: 400;">
			Contact管理 <small style="color:#777; font-weight: 400; line-height: 1;font-size:60%;">分角色式授权管理系统</small>
		</h1>
	</div>
	<div class="login-box"> <!-- 登录框 -->
		<form name="login-form" method="post">
			<!-- 注册登录用户名 -->
			<div class="user-name">
				<span><i class="login user" aria-hidden="true"></i></span>
				<img alt="" src="img/user-icon.png" class="user-icon" />
				<input class="user-edit" name="user-name" type="text" value="" placeholder="  输 入 用 户 名">
			</div>
			<!-- 注册登录用户部门选择 -->
			<div class="user-dpt">
				<span><i class="login dpt" aria-hidden="true"></i></span>
				<img alt="" src="img/dpt-icon.png" class="dpt-icon" />
				<select class="dpt-edit">
					<option value="finance-dpt">请选择所属部门</option>
 					<option value="finance-dpt">财务部</option>
  					<option value="sale-dpt-china">业务-瓷器部</option>
  					<option value="sale-dpt-fo">业务-佛像部</option>
				</select>
			</div>
			<!-- 设置登录密码 -->
			<div class="user-pwd">
				<span><i class="login pwd" aria-hidden="true"></i></span>
				<img alt="" src="img/pwd-icon.png" class="pwd-icon" />
				<input class="pwd-edit" name="user-pwd" type="password" value="" placeholder="  设 置  密 码">
			</div>
			<!-- 重复登录密码 -->
			<div class="user-pwd1">
				<span><i class="login pwd1" aria-hidden="true"></i></span>
				<img alt="" src="img/pwd-icon.png" class="pwd-icon" />
				<input class="pwd-edit" name="user-pwd1" type="password" value="" placeholder="  重 复 输 入 密 码">
			</div>
			<!-- 确认注册按钮 -->
			<input class="login-button" type="submit" id="submit1" name="submit1" 
					value="确认注册" onclick="document.getElementById('abc').value='1';" />
		</form>
	</div>
</div>
</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>