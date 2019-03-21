<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<%@ page language="java" import="com.customer.*"%>
<%@ page language="java" import="com.right.*"%>
<% request.setCharacterEncoding("utf-8");%>


<%
	String user_id = request.getParameter("pid");//获取从登录界面得到的用户id
	Map<String,String> userInfo = new HashMap<String,String>();
	UserDao instance = new UserDao();
	userInfo = instance.getUserInfo(user_id);
	
	String userId = userInfo.get("userId");
   String userName = userInfo.get("userName");
   String userPwd = userInfo.get("userPwd");
   String userDept = userInfo.get("userDept");
   String userPhone = userInfo.get("userPhone");
   String userCode= userInfo.get("userCode");
   String userRole = userInfo.get("userRole");
   
   	OnlyRight myRight = new OnlyRight();
   	String newContact_table =  myRight.getNewContact(user_id).toString();
   
%>    
    
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>首页-Contact管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main-new.css">
	<link rel="stylesheet" href="css/user-new.css">
	<link rel="stylesheet" href="css/active.css">
	
	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
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

<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">
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
									 <a href="VIP.jsp?pid=<%=user_id %>" class="btn">VIP客户</a>
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
			</nav>
			<div class="page-header" id="s-main-header">
				<h1>
					Contact管理 <small>分角色式授权管理系统</small>
				</h1>
			</div> 
			<ul id="myTab" class="nav nav-tabs">
				<li class="active">
					 <a href="#home" data-toggle="tab">首页</a>
				</li>
				<li>
					 <a href="#new" data-toggle="tab">最新合同</a>
				</li>
				<li>
					 <a href="#info" data-toggle="tab">员工信息</a>
				</li>
				
			</ul>
			<div id="myTabContent" class="tab-content">
	    		<div class="tab-pane fade in active" id="home">
					<h2>快速导航</h2>
					<p>您好，欢迎登入Contact合同管理系统!</p>
					<p>
						 <a class="btn" href="#">查看/下载使用指南 &gt;&gt;</a>
					</p>
					<div class="row">
						<div class="col-md-4">
							<div class="thumbnail s-thumbnail">
								<img alt="" src="v3/default4.jpg">
								<div class="caption">
									<h3>
										合同列表
									</h3>
									<p>
										此模块包含用户经手（合同联系人）的所有在有效期的合同列表，点击查看详情可进入列表页面，对合同进行进一步管理；点击直接下载，可以直接将列表pdf保存至本地查看使用。
									</p>
									<p>
										 <a class="btn btn-primary" href="active-contact.jsp?pid=<%=user_id %>">查看详情</a>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="thumbnail s-thumbnail">
								<img alt="" src="v3/default5.jpg" />
								<div class="caption">
									<h3>
										待提货列表
									</h3>
									<p>
										此模块包含近10天需要来提取货物并且清算的合同列表，可以进行通知提货和查看合同操作。
									</p>
									<p>
										 <a class="btn btn-primary" href="advancing-contact.jsp?pid=<%=user_id %>">查看详情</a> 
									</p>
								</div>
							</div>
						</div>
						
						<div class="col-md-4">
							<div class="thumbnail s-thumbnail">
								<img alt="" src="v3/default6.jpg">
								<div class="caption">
									<h3>
										客户列表
									</h3>
									<p>
										点击进入客户列表管理页面，也可直接下载与员工本人相关联的客户名单。
									</p>
									<p>
										 <a class="btn btn-primary" href="customer.jsp?pid=<%=user_id %>">查看详情</a> 
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
					<div class="col-md-4">
							<div class="thumbnail s-thumbnail">
								<img alt="" src="v3/default5.jpg">
								<div class="caption">
									<h3>
										创建合同
									</h3>
									<p>
										此模块为可编辑的合同模板，点击创建可进入编辑页面，增加的合同会保存到本地；点击下载模板，可以空白合同pdf保存至本地查看使用。
									</p>
									<p>
										 <a class="btn btn-primary" href="add-contact.jsp?pid=<%=user_id %>">点击创建</a>
									</p>
								</div>
							</div>
						</div>
					<div class="col-md-4">
						<div class="thumbnail s-thumbnail">
							<img alt="" src="v3/default4.jpg" />
							<div class="caption">
								<h3>
									星标合同
								</h3>
								<p>
									重要合同列表，应为工作优先处理的项目。
								</p>
								<p>
									 <a class="btn btn-primary" href="star-contact.jsp?pid=<%=user_id %>">查看详情</a>
								</p>
							</div>
						</div>
					</div>
					
					<div class="col-md-4">
						<div class="thumbnail s-thumbnail">
							<img alt="" src="v3/default6.jpg" />
							<div class="caption">
								<h3>
									拍品库
								</h3>
								<p>
									包含本公司所有拍品的基本资料以及成交状况。
								</p>
								<p>
									 <a class="btn btn-primary" href="lots.jsp?pid=<%=user_id %>">查看详情</a>
								</p>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="tab-pane fade" id="new">
		        <div class="table-responsive">
							<table class="table">
								<caption>近期签订合同列表</caption>
								<thead>
									<tr>
										<th>合同编号</th>
										<th>签订日期</th>
										<th>客户编号</th>
										<th>拍品编号</th>
										<th>星标合同</th>
									</tr>
								</thead>
								<tbody>
									<%=newContact_table %>
								</tbody>
							</table>
						</div>
				</div>
				<div class="tab-pane fade" id="info">
					<div class="table-responsive"  id="s-home-info-table">
							<table class="table">
								<caption id="s-home-info-caption">员工信息表</caption>
								<tbody id="s-home-info-body">
									<tr>
										<td>工号</td><td><%=userId%></td>
										<td>姓名</td><td><%=userName%></td>
									</tr>
									<tr>
										<td>身份证号</td><td><%=userCode%></td>
										<td>电话</td><td colspan="3"><%=userPhone%></td>
									</tr>
									<tr>
										<td>部门</td><td><%=userDept%></td>
										<td>职位</td><td><%=userRole%></td>
									</tr>
								</tbody>
							</table>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>