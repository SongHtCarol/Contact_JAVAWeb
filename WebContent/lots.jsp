<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<%@ page language="java" import="com.customer.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
	String user_id = request.getParameter("pid");//获取从登录界面得到的用户id
	String lot_table = "";
	SearchLot  sl = new SearchLot();
	lot_table = sl.SearchLotTable().toString();
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>拍品库-Contact管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main-new.css">
	<link rel="stylesheet" href="css/user-new.css">
	<link rel="stylesheet" href="css/draft.css">
	<link rel="stylesheet" href="css/active.css">
	<style>
		#s-header-dropdown{
			right: auto;
		}
		#s-header-navbar-right {
    		float: right !important;
    		margin-right: 20px;
  		}
	</style>
	
</head>

<body onload="goLotPage(1,3)">

<div class="container" >
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation"><!-- ??? -->
				
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">Contact管理</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="home.jsp?pid=<%=user_id %>" >主页</a>
						</li>
						<li>
							 <a href="#">系统简介</a>
						</li>
					</ul>
					<!--  
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="  请输入合同编号"/>
						</div> <button type="submit" class="btn btn-default">查找</button>
					</form>
					-->
					<ul class="nav navbar-nav navbar-right" id="s-header-navbar-right">

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">管理合同<strong class="caret"></strong></a>
							<ul id="s-header-dropdown" class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
								<li>
									 <a href="active-contact.jsp?pid=<%=user_id %>" class="btn">合同列表</a>
								</li>
								<li>
									 <a href="add-contact.jsp?pid=<%=user_id %>" class="btn">创建合同</a>
								</li>
								<li>
									 <a href="star-contact.jsp?pid=<%=user_id %>" class="btn">星标合同</a>
								</li>
								<!--  
								<li>
									 <a href="VIP.jsp?pid=" class="btn">VIP客户</a>
								</li>
								-->
							</ul>
						
						<li>
							 <a href="customer.jsp?pid=<%=user_id %>">客户列表</a>
						</li>
						<li>
							 <a href="lots.jsp?pid=<%=user_id %>">拍品库</a>
						</li>
					</ul>
				</div>
				
			</nav><!-- 导航栏 -->
			<div class="page-header" id="s-main-header"><!-- page header -->
				<h1>
					Contact管理 <small>分角色式授权管理系统</small>
				</h1>
			</div> <!-- page header -->
			<div class="col-md-12 column" >
				<div id="s-draft-panel">
					<%=lot_table %>
				</div>
				
				<div id="s-active-pagination">
					<ul class="pagination" id="myPage">
					</ul>
				</div>

			</div><!-- colspan9 -->
			
		</div><!-- colspan12 -->
	</div>
</div>
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/table_page.js"></script>
</body>
</html>