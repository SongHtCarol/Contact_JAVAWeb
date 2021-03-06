<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<%@ page language="java" import="com.customer.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
	String user_id = request.getParameter("pid");//获取从登录界面得到的用户id
	//request.getSession().setAttribute("user_id",user_id);	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>VIP客户-Contact管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main-new.css">
	<link rel="stylesheet" href="css/user-new.css">
	<link rel="stylesheet" href="css/active.css">

	<style>
		input[type="date"]::-webkit-clear-button {
	   	display:none;
		}
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
<div class="modal fade" id="modal-container-819866" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 style="color:#303ca8; letter-spacing: 3px; "> 操作提示！</h4>将该客户移出VIP列表后不可恢复，请认真核实情况！
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-default" data-dismiss="modal">确认移除</button> 
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="modal-VIP-info" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 style="color:#303ca8; letter-spacing: 3px; "> VIP客户详情</h4>
				<table class="table table-bordered table-hover" style="text-align:center;">
				<thead >
					<tr >
						<th style="text-align:center;">姓名</th>
						<th style="text-align:center;">Alice</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>客户编号</td>
						<td>100058</td>
					</tr>
					<tr>
						<td>客户等级</td>
						<td>S</td>
					</tr>
					<tr>
						<td>联系电话</td>
						<td>15415456156</td>
					</tr>
					<tr>
						<td>历史消费总额</td>
						<td>100000</td>
					</tr>
					<tr>
						<td>历史消费次数</td>
						<td>10</td>
					</tr>
				</tbody>
			</table>
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-default" data-dismiss="modal">确认</button> 
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
							 <a  href="home.jsp?pid=<%=user_id %>" >主页</a>
						</li>
						<li>
							 <a href="#">系统简介</a>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="  请输入合同编号"/>
						</div> <button type="submit" class="btn btn-default">查找</button>
					</form>
					
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
								<li>
									 <a href="VIP.jsp?pid=<%=user_id %>" class="btn">VIP客户</a>
								</li>
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
			<iframe id="myiframe1" name="myiframe1" width="0" height="0" style="display:none;"></iframe>
			<iframe id="myiframe" name="myiframe" ></iframe>
			<div id="s-active-table">
			<table class="table table-hover" >
				<caption>VIP客户列表</caption>
					<thead>
						<tr>
							<th>客户编号</th>
							<th>客户姓名</th>
							<th>联系方式</th>
							<th>操作选项</th>
						</tr>
					</thead>
				<tbody>
					<tr>
						<td>Tanmay</td>
						<td>Bangalore</td>
						<td>Bangalore</td>
						<td>
							<a id="" href="#modal-VIP-info"  role="button" class="btn  btn-default view-VIP-btn" data-toggle="modal">会员详情</a>	
							<a id="" href="#modal-container-819866" onclick="cancelVIP(event)" role="button" class="btn  btn-default cancel-btn" data-toggle="modal">移除VIP</a>	
						</td>
					</tr>
					<tr>
						<td>Tanmay</td>
						<td>Bangalore</td>
						<td>560001</td>
						<td>
						<form name="VIP_form" tyle="margin-bottom:100px;"  target="myiframe">
							<button type="button"  onclick="viewVIP(event,'43')" class="btn  btn-default view-VIP-btn"  >会员详情</button>
							<a id="" href="#modal-container-819866" onclick="cancelVIP(event)" role="button" class="btn  btn-default cancel-btn" data-toggle="modal">移除VIP</a>	
						</form>
						</td>
					</tr>
					<tr>
						<td>Tanmay</td>
						<td>Bangalore</td>
						<td>560001</td>
						<td>
							<a id="" href="#modal-VIP-info" onclick="viewVIP(event)" role="button" class="btn  btn-default view-VIP-btn" data-toggle="modal">会员详情</a>	
							<a id="" href="#modal-container-819866" onclick="cancelVIP(event)" role="button" class="btn  btn-default cancel-btn" data-toggle="modal">移除VIP</a>	
						</td>
					</tr>
				</tbody>
			</table>
			</div>
				<div id="s-active-pagination">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
		</div>
	</div>
</div>

	<script src="js/jquery.js"></script>
	<script src="js/active-contact.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js"></script>
	
</body>
</html>