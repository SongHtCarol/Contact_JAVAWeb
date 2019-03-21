<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.contact.MySQLDBCon"%>
<% request.setCharacterEncoding("utf-8");%>

<%
	Connection conn = null;
	String connectString = "jdbc:mysql://localhost:3306/project"
		+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8&&useSSL=false";

	String input_id = request.getParameter("input-name");
	String input_pwd = request.getParameter("input-pwd");
	String login_submit =  request.getParameter("login-btn");
	
	boolean check_ok = false;
	String msg = "";
	
	if(input_id == null) {
		input_id="";
		check_ok = false;
	}
	if(input_pwd == null) {
		input_pwd="";
		check_ok = false;
	}
	if(login_submit == null) login_submit="";
	System.out.println(login_submit);
	if(login_submit.equals("1")){
		if(input_id.equals("")){
			msg = "用户名不能为空！";
			System.out.println("用户名不能为空！");
		}
		else if(input_pwd.equals("")){
			msg = "密码不能为空！";
			System.out.println("密码不能为空!");
		}
		
		else{
			
			int max_par = 0;
			boolean noexist = true;
			
			conn = MySQLDBCon.getCon();
			
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select* from s_users");
			while(rs.next()) {
				//遍历整个数据库，匹配
				System.out.println(rs.getString("user_id"));
				if (rs.getString("user_id").equals(input_id)){
					noexist = false;
					if (rs.getString("user_pwd").equals(input_pwd)){
						input_id = rs.getString("user_id");
						check_ok = true;
					}
				}
			}
			
			if(noexist){
				msg = "该用户不存在！";
				System.out.println("该用户不存在！");
			}
			else if(!check_ok) {
				msg = "密码输入错误！";
				System.out.println("密码输入错误！");
			}
			else if(check_ok){
			
				System.out.println("可以跳转！");
				response.sendRedirect("home.jsp?pid="+input_id); 
			}
			
		}
	}
	

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>登录-合同管理系统</title>
	
	<link rel="stylesheet" type="text/css" href="css/login.css" />
</head>

<body>
<div class="main"> <!-- 主要界面 -->
	<div class="top-box">
		<a id="s-login-logo"class="navbar-brand" href="index.jsp">Contact管理-主页</a>
	</div> <!-- 底层上部背景 -->
	<div class="page-header" id="s-main-header">
		<h1 style="font-size: 36px;font-weight: 400;">
			Contact管理 <small style="color:#777; font-weight: 400; line-height: 1;font-size:60%;">分角色式授权管理系统</small>
		</h1>
	</div>
	<div style="margin:0 auto;text-align:center;"><p><%=msg%></p></div>
	<div class="login-box"> <!-- 登录框 -->
		<form method="post" name="login-form">
			<!-- 登录用户名 -->
			<div class="user-name">
				<span><i class="login user" aria-hidden="true"></i></span>
				<img alt="" src="img/user-icon.png" class="user-icon" />
				<input class="user-edit" name="input-name" type="text" value="" placeholder="  帐 号">
			</div><!-- /input-group user-name -->
			<!-- 登录密码 -->
			<div class="user-pwd">
				<span><i class="login pwd" aria-hidden="true"></i></span>
				<img alt="" src="img/pwd-icon.png" class="pwd-icon" />
				<input class="pwd-edit" name="input-pwd" type="password" value="" placeholder="  密 码">
			</div><!-- /input-group user-pwd -->

			<div class="Check-input">
				<span><i class="check code" aria-hidden="true"></i></span>
				<img alt="" src="img/check-icon.png" class="pwd-icon" />
				<input type="text" class="Check-Code"  value="" placeholder="  输入验证码">
				<button class="btn btn-default">Go!</button>
			</div>

			<div class="Check-picture">
				<img src="img/test.png" id="CreateCheckCode" class="check-picture">
				<a href="" onclick="myReload()" class="change-link">看不清，换一个</a>
			</div>

			<!-- 登录按钮 -->
			<input type="hidden" id="login-btn" name="login-btn" value="0">
			<input class="login-button" type="submit" id="submit" name="submit"
					value="立即登录" onclick="document.getElementById('login-btn').value='1';" />
			<!-- 注册链接 -->
			<a class="link" href="#">还没有账号？点击立即注册</a>
		</form>

	<!-- </div> /登录框 login-box -->
	<!-- <div class="checkCode-box"> -->
	<!--	<form action="loginServlet" method="get" name="check-form">

			<div class="Check-input">
				<span><i class="check code" aria-hidden="true"></i></span>
				<button class="btn btn-default">Go!</button>
				<input type="text" class="Check-Code"  value="" placeholder="  输入验证码">
			</div>

			<div class="Check-picture">
				<img src="img/pwd-icon.png" id="CreateCheckCode" class="check-picture">
				<a href="" onclick="myReload()" class="change-link">看不清，换一个</a>
			</div>

		</form><!--验证码 -->
		
	 </div> <!-- checkCodeForm -->
</div>

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	

</body>
</html>


