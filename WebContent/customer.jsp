<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<%@ page language="java" import="com.customer.*"%>
<%@ page language="java" import="com.right.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
	String user_id = request.getParameter("pid");
	String cus_table = "";
	UserDao myInfo = new UserDao();
	Map<String,String> userInfo = new HashMap<String,String>();
	userInfo = myInfo.getUserInfo(user_id);
	System.out.println(userInfo.get("lookCusRight"));
	if(userInfo.get("lookCusRight").equals("all")){
		ALLRight myRight = new ALLRight();
		cus_table =  myRight.getCusTable(user_id).toString();
	}else if(userInfo.get("lookCusRight").equals("all-dept")){
		String dept_id = userInfo.get("dept_id");
		System.out.println(dept_id);
		DeptRight myRight = new DeptRight();
		cus_table =  myRight.getCusTable(dept_id,user_id).toString();
	}else if(userInfo.get("lookCusRight").equals("only")){
		OnlyRight myRight = new OnlyRight();
		cus_table =  myRight.getCusTable(user_id).toString();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>客户列表-Contact管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main-new.css">
	<link rel="stylesheet" href="css/active.css">


	<style>
		#s-header-dropdown{
			right: auto;
		}
		#s-header-navbar-right {
    		float: right !important;
    		margin-right: 20px;
  		}
  		.btn.btn-default.VIP:focus,
  		.btn.btn-default.VIP:hover{
        background-color: #fff;
    	}
	</style>
</head>

<body onload="setInnerHTMLByClass('VIP');goPage(1,8);">

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation"><!-- 导航栏 -->
				
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
			<div id="s-active-table">
			<table class="table table-hover" id="my_table">
				<caption>客户列表</caption>
					<thead>
						<tr>
							<th>客户编号</th>
							<th>客户姓名</th>
							<th>联系方式</th>
							<th>交易次数</th>
						</tr>
					</thead>
				<tbody>
					<%=cus_table %>
				</tbody>
			</table>
			</div>
				<div id="s-active-pagination">
					<ul class="pagination" id="myPage">
					</ul>
				</div>
		</div>
	</div>
</div>
	<script src="js/jquery.js"></script>
	<script src="js/s-change-icon.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/table_page.js"></script>
</body>
</html>