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
	String contact_table = "";
	UserDao myInfo = new UserDao();
	Map<String,String> userInfo = new HashMap<String,String>();
	userInfo = myInfo.getUserInfo(user_id);
	System.out.println(userInfo.get("lookContactRight"));
	if(userInfo.get("lookContactRight").equals("all")){
		ALLRight myRight = new ALLRight();
		contact_table =  myRight.getContactTable(user_id).toString();
	}else if(userInfo.get("lookContactRight").equals("all-dept")){
		String dept_id = userInfo.get("dept_id");
		System.out.println(dept_id);
		DeptRight myRight = new DeptRight();
		contact_table =  myRight.getContactTable(dept_id,user_id).toString();
	}else if(userInfo.get("lookContactRight").equals("only")){
		OnlyRight myRight = new OnlyRight();
		contact_table =  myRight.getContactTable(user_id).toString();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>有效期合同-Contact管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main-new.css">
	<link rel="stylesheet" href="css/user-new.css">
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

<body onload="goPage(1,8)">
<div class="modal fade" id="modal-container-819866" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 style="color:#303ca8; letter-spacing: 3px; "> 跳转提示！</h4>修改合同只限于对甲方联系人的联系方式、提货相关信息进行修改！
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-default" data-dismiss="modal">确认跳转</button> 
			</div>
		</div>
		
	</div>
	
</div>
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
				<caption>有效合同列表</caption>
					<thead>
						<tr>
							<th>合同编号</th>
							<th>签订日期</th>
							<th>客户编号</th>
							<th>星标客户</th>
							<th>操作选项</th>
						</tr>
					</thead>
				<tbody>
					
					
					<%=contact_table %>
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
	<script src="js/active-contact.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/table_page.js"></script>
</body>
</html>