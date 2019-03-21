<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<%@ page language="java" import="com.customer.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
	String user_id = request.getParameter("pid");
	//lot element:
	String lot_id = "";
	String contact_id = "";
	lot_id = request.getParameter("lot_id");
	contact_id = request.getParameter("contact_id");
	//contact info
	Map<String,String> contactInfo = new HashMap<String,String>();
	ContactDao instance = new ContactDao();
	contactInfo = instance.getContactInfo(contact_id);
	String CreateDate = contactInfo.get("CreateDate");
	String EffectiveDate = contactInfo.get("EffectiveDate");
	String LotId = contactInfo.get("LotId");
	String CustomerId = contactInfo.get("CustomerId");
	//String UserId = contactInfo.get("UserId");
	String Star = contactInfo.get("Star");
	//lot info
	Map<String,String> lotInfo = new HashMap<String,String>();
	SearchLot instance1 = new SearchLot();
	lotInfo = instance1.SearchLotInfo(LotId);
	String lotName = lotInfo.get("lotName");
	String yearTime = lotInfo.get("yearTime");
	String postTime = lotInfo.get("postTime");
	String sourceFrom = lotInfo.get("sourceFrom");
	String labelInfo = lotInfo.get("labelInfo");
	String sizeInfo = lotInfo.get("sizeInfo");
	String situation = lotInfo.get("situation");
	String price = lotInfo.get("price");
	String payMethod = lotInfo.get("payMethod");
	String picker = lotInfo.get("picker");
	String pickerEmail = lotInfo.get("pickerEmail");
	String pickerPhone = lotInfo.get("pickerPhone");
	String pickDate = lotInfo.get("pickDate");
	
	//customer info
	Map<String,String> customerInfo = new HashMap<String,String>();
	CustomerDao instance2 = new CustomerDao();
	customerInfo = instance2.getCustomerInfo(CustomerId);
	String CustomerName = customerInfo.get("CustomerName");
	String CustomerCode = customerInfo.get("CustomerCode");
	String CustomerPhone = customerInfo.get("CustomerPhone");
	String CustomerRank = customerInfo.get("CustomerRank");
	String CustomerVIP = customerInfo.get("CustomerVIP");
	String UserId = customerInfo.get("UserId");
	
	//user_info
	Map<String,String> userInfo = new HashMap<String,String>();
	UserDao instance3 = new UserDao();
	userInfo = instance3.getUserInfo(user_id);
	
	String userName = userInfo.get("userName");
	String userPhone = userInfo.get("userPhone");
	String userCode= userInfo.get("userCode");
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>合同详情-Contact管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main-new.css">
  
	<link rel="stylesheet" href="css/detail.css">

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
					<ul class="nav navbar-nav navbar-right">

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
			<div id="s-detail-table">
				<table class="table table-bordered">
					<caption id="s-detail-caption">XXXX公司XXX品合同协议</caption>
					<tbody id="s-detail-body">
						<tr>
							<td>合同编号</td><td ><%=contact_id %></td>
							<td>创建日期</td><td ><%=CreateDate %></td>
							<td>生效日期</td><td ><%=EffectiveDate %></td>
						</tr>
						<tr>
							<td>拍品编号</td><td ><%=LotId %></td>
							<td>拍品名称</td><td colspan="3"><%=lotName %></td>
						</tr>
						<tr>
							<td>甲方-联系人</td><td><%=userName %></td>
							<td>甲方-身份证号</td><td><%=userCode %></td>
							<td>甲方-联系方式</td><td><%=userPhone %></td>
						</tr>
						<tr>
							<td>乙方-联系人</td><td><%=CustomerName %></td>
							<td>乙方-身份证号</td><td><%=CustomerCode %></td>
							<td>乙方-联系方式</td><td><%=CustomerPhone %></td>
						</tr>
						<tr>
							<td colspan="6">拍品规格</td>
						</tr>
						<tr>
							<td>年代</td><td><%=yearTime %></td>
							<td>上拍时间</td><td><%=postTime %></td>
							<td>传承</td><td><%=sourceFrom %></td>
						</tr>
						<tr>
							<td>款识</td><td colspan="2"><%=labelInfo %></td>
							<td>尺寸</td><td colspan="2"><%=sizeInfo %></td>
						</tr>
						<tr>
							<td colspan="4">协议事项</td>
							<td colspan="2" style="font-weight: 600;">签字/姓名章</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:left; padding-left:20px;width:200px;">合同是当事人或当事双方之间设立、变更、终止民事关系的协议。依法成立的合同受法律保护。<br>广义合同指所有法律部门中确定权利、义务关系的协议。<br>狭义合同指一切民事合同。还有最狭义合同仅指民事合同中的债权合同。<br>《中华人民共和国民法通则》第85条：合同是当事人之间设立、变更、终止民事关系的协议。<br>依法成立的合同，受法律保护。<br>《中华人民共和国合同法》第2条：合同是平等主体的自然人、法人、其他组织之间设立、变更、终止民事权利义务关系的协议。<br>婚姻、收养、监护等有关身份关系的协议，适用其他法律的规定。</td>
							<td style="font-weight: 100; vertical-align:top;">甲方</td>
							<td style="font-weight: 100; vertical-align:top;">乙方</td>
						</tr>
						<tr>
							<td>成交金额</td><td style="text-align:left;padding-left:20px;">小写（RMB）：<%=price %></td>
							<td>付款方式</td><td><%=payMethod %></td>
							<td>提货人</td><td><%=picker %></td>
						</tr>
						<tr>
							<td>提货日期</td><td><%=pickDate %></td>
							<td>提货人联系电话</td><td><%=pickerPhone %></td>
							<td>提货人邮箱</td><td><%=pickerEmail %></td>
						</tr>
						<tr >
							<td colspan="2" style="border:0; font-weight:600;font-size:80%;text-align:left;">公司地址: XX省XX市XX区XX街000号</td>
							<td style="border:0; font-weight:600;font-size:80%;text-align:left;">电话:010-1234562</td><td  colspan="3" style="border:0; font-weight:600;font-size:80%;text-align:right;">本合同一式三份，双方确认签署后生效</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>