<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Contact合同管理系统</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/main-new.css">
</head>

<body id="s-body">
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		<div class="modal fade" id="modal-container-819866" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
							<h4 style="color:#303ca8; letter-spacing: 3px; "> 无效动作！</h4>您还没有登录账户，暂时没有进入系统的权限！
						</div>
						<div class="modal-footer">
							 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> 
						</div>
					</div>
					
				</div>
				
			</div>
			<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">Contact管理</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a id="modal-819866" href="#modal-container-819866" role="button" class="btn" data-toggle="modal">主页</a>
						</li>
						<li>
							 <a href="#">系统简介</a>
						</li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="register.jsp">注册</a>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">登录<strong class="caret"></strong></a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li>
									 <a href="login.jsp">员工登录</a>
								</li>
								<li>
									 <a href="#">管理员登录</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<div class="page-header" id="s-main-header">
				<h1>
					Contact管理 <small>分角色式授权管理系统</small>
				</h1>
			</div> 
			<div id="s-main-part">
				<button class="btn btn-default" type="button" id="s-login-main-btn" onclick="window.location.href='login.jsp';">立刻登入系统</button> <button class="btn btn-default btn-link" type="button" id="s-register-main-btn" onclick="window.location.href='register.jsp';">还没有账户？点击快速拥有登入权限</button>
				<p id="s-main-text">
					 <em>Contact</em> 是一个将用户<strong>按角色分配权限</strong>的管理系统,可以实现分部门查询权限内信息，并对其进行管理。</p>
				<p id="s-main-footer"><small>工程创建人：宋涵天 / 软件工程，数据科学与计算机学院/ 导师：桑应朋 </small> </p>
			</div>
		</div>
	</div>
</div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>
</html>
