<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
//contact element:
	String contact_id = request.getParameter("contact_id");
	contact_id = null;
	String create_date = request.getParameter("create_date");
	String effective_date = request.getParameter("effective_date");
	
	String pid = request.getParameter("pid");
	Integer last_id = null;
	Connection conn = null;
    try {
    	conn = MySQLDBCon.getCon(); // 建立数据库连接
    	
    	String Sql = 
    			"SELECT MAX(contact_id) AS last_id FROM s_contacts";
      Statement  stmt = (Statement) conn.createStatement();  
        //使用Connection来创建一个Statment对象  
      ResultSet rs =stmt.executeQuery(Sql); 
      while (rs.next()){  
         //System.out.println(rs.getInt(1) + "/t");
         last_id = rs.getInt(1);
      }  
    }catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	if(last_id ==null) contact_id="1";
	else {
		
		contact_id = String.valueOf(last_id+1);
	}
//user element：能不能考虑全局
	String user_id = pid;
	Map<String,String> userInfo = new HashMap<String,String>();
	UserDao instance = new UserDao();
	userInfo = instance.getUserInfo(pid);
	
   String user_name = userInfo.get("userName");
   String user_phone = userInfo.get("userPhone");
   String user_code= userInfo.get("userCode");
//customer element:
	String customer_id = "";
	String customer_name = "";
	String customer_phone = "";
	String customer_rank = "";
	String customer_VIP = "";
//	lot element:
	

	Integer situtation = null;
	String price = "";
	String pay_method = "";
	String picker = "";
	String picker_email = "";
	String pick_date = "";
	
	request.getSession().setAttribute("user_id",user_id);	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>创建合同-Contact管理系统</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/main-new.css">
  	<link rel="stylesheet" href="css/jquery-ui.min.css">
	<link rel="stylesheet" href="css/detail.css">

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
  		.btn.btn-default.btn-sm.星标:focus,
  		.btn.btn-default.btn-sm.星标:hover{
        background-color: #fff;
    	}
	</style>
</head>

<body onload="setInnerHTMLByClass('星标');">

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
			
			<form id="search_form" name="search_form" action="AddServlet" method="post" style="margin-bottom:100px;"  target="myiframe1">
			
			<p style="float:right;">
	      <input style="display:inline;width:300px;" id="search-lot-id" name="search-lot-id" type="search" class="form-control " maxlength="8"  autofocus
									placeholder="输入拍品编号，点击>查询拍品" >
	      <button class="btn btn-default" id="search-lot" name="search-lot"  value="0" 
	      			onclick="search(event)"> 查询拍品</button>
			</p>
			</form>
			<iframe id="myiframe1" name="myiframe1" width="0" height="0" style="display:none;"></iframe> 
			
			<form id="add_form" name="add_form" action="AddServlet" method="post" style="margin-bottom:100px;" onsubmit="return check()" target="detail-contact.jsp" >

			<p>
	        <button  name="star" type="button" class="btn btn-default btn-sm 星标" value="0" onclick="changeStar(event,'星标')">
	          <span  id="" class="glyphicon glyphicon-star-empty s-draft-star" ></span> 
	        </button>
	      </p>
	      <input type="hidden" name="input_star"  id="input-star" value="0">
			<div id="s-detail-table">
				<table class="table table-bordered">
					<caption id="s-detail-caption">XXXX公司XXX品合同协议 </caption>
					
					<tbody id="s-detail-body">
						<tr>
							<td>合同编号</td><td ><input readonly="true" name="contact_id" id="contact_id" type="text" class="form-control" value="<%=contact_id %>"></td>
							<td>创建日期</td><td ><input readonly="true" name="create_date" id="create_date" type="text" class="form-control" ></td>
							<td>生效日期</td><td ><input readonly="true" name="effective_date" id="effective_date" type="text" class="form-control" ></td>
						</tr>
						<tr>						
							
							<td>拍品编号</td><td><input readonly="true" name="lot_id" id="lot_id" type="text" class="form-control" ></td>
							<td>拍品名称</td><td colspan="3" id="lot_name"></td>
						</tr>
						<tr>
							<td>甲方-联系人</td><td id="user_name"><%=user_name%></td>
							<td>甲方-身份证号</td><td id="user_code"><%=user_code%></td>
							<td>甲方-联系方式</td><td id="user_phone"><%=user_phone%></td>
						</tr>
						<tr>
							<td>乙方</td><td><input name="customer_name" type="text" class="form-control"></td>
							<td>乙方-身份证号</td><td><input name="customer_code" type="text" class="form-control" maxlength="18"></td>
							<td>乙方-联系方式</td><td><input name="customer_phone" type="text" class="form-control" maxlength="11"></td>
						</tr>
						<tr>
							<td colspan="6">拍品规格</td>
						</tr>
						<tr>
							<td>年代</td><td id="year_time"></td>
							<td>上拍时间</td><td id="post_time"></td>
							<td>传承</td><td id="source_from"></td>
						</tr>
						<tr>
							<td>款识</td><td id="label" colspan="2"></td>
							<td>尺寸</td><td id="size" colspan="2"></td>
						</tr>
						<tr>
							<td colspan="4">协议事项</td>
							<td colspan="2" style="font-weight: 600;">签字/姓名章</td>
						</tr>
						<tr>
							<td colspan="4" style="text-align:left; padding-left:20px;width:200px;">合同是当事人或当事双方之间设立、变更、终止民事关系的协议。依法成立的合同受法律保护。<br>广义合同指所有法律部门中确定权利、义务关系的协议。<br>狭义合同指一切民事合同。还有最狭义合同仅指民事合同中的债权合同。<br>《中华人民共和国民法通则》第85条：合同是当事人之间设立、变更、终止民事关系的协议。<br>依法成立的合同，受法律保护。<br>《中华人民共和国合同法》第2条：合同是平等主体的自然人、法人、其他组织之间设立、变更、终止民事权利义务关系的协议。<br>婚姻、收养、监护等有关身份关系的协议，适用其他法律的规定。</td>
							<td style="font-weight: 100; vertical-align:top;">乙方</td>
							<td style="font-weight: 100; vertical-align:top;">甲方（公章）</td>
						</tr>
						<tr>
							<td>成交金额</td><td style="text-align:left;padding-left:20px;">小写（RMB）：<input name="price" type="text" class="form-control"></td>
							<td>付款方式</td>
							<td>	
								<label class="radio-inline">
									<input type="radio" name="pay_method" id="optionsRadios3" value="银行卡" checked> 银行卡
								</label>
								<label class="radio-inline">
									<input type="radio" name="pay_method" id="optionsRadios4"  value="支付宝"> 支付宝
								</label>
							</td>
							<td>提货人</td><td ><input name="picker" type="text" class="form-control"></td>
						</tr>
						<tr>
							<td>提货日期</td><td >
								<input type="date" name="pick_date" class="form-control" id="s-add-date">
							</td>
							<td>提货人联系电话</td><td><input type="text" name="picker_phone" class="form-control" maxlength="11"></td>
							<td>提货人邮箱</td><td><input type="email" name="picker_email" class="form-control"></td>
						</tr>
						<tr >
							<td colspan="2" style="border:0; font-weight:600;font-size:80%;text-align:left;">公司地址: XX省XX市XX区XX街000号</td>
							<td style="border:0; font-weight:600;font-size:80%;text-align:left;">电话:010-1234562</td><td  colspan="3" style="border:0; font-weight:600;font-size:80%;text-align:right;">本合同一式三份，双方确认签署后生效</td>
						</tr>
					</tbody>
				</table>
			</div>
			<input type="hidden" id="user_id" value="<%=pid%>"/>
			<input type="hidden" name="which_submit" id="which_submit" value="0"/>
			<button type="submit" class="btn btn-default" id="save-contact" name="save-contact" onclick="save(event)" value="0">发布合同</button>
			 <script type="text/javascript">
				function save(event){
					document.getElementById('which_submit').value='1';
							
					var lot_id = document.getElementById("lot_id").value;
					var contact_id = document.getElementById("contact_id").value;
					var user_id = document.getElementById("user_id").value;
					console.log(user_id);
					window.location.replace("detail-contact.jsp?pid="+user_id+"&lot_id="+lot_id+"&contact_id="+contact_id); 
				
				}
			</script>
			<button type="reset"  class="btn btn-default" id="reset-btn" name="reset-btn" onclick="document.getElementById('which_submit').value='3';" value="0">重置</button>
			</form>
			
		</div>
	</div>
</div>
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui.min.js"></script>

	<script src="js/s-change-icon.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/add-contact.js"></script>
<script type="text/javascript">
    var myiframe=document.getElementById('myiframe1');
    //兼容IE事件
    function addEvent(node,event,handler){
        if(!!node.addEventListener){
            node.addEventListener(event,handler,!1);
        }else{
            node.attachEvent('on'+event,handler);
        }
    }
    //给iframe注册load事件
    addEvent(myiframe,'load',function(event){
        try{
        	var situation="";
        	situation = document.getElementById("myiframe1").contentWindow.document.getElementById("situation:").innerText;
        	//console.log("myiframe get situation = "+situation);
        	
        	if(situation=="0"){
        		lot_id = document.getElementById("myiframe1").contentWindow.document.getElementById("lot_id:").innerText;
            	document.getElementById("lot_id").value = lot_id;
            	
            	lot_name = document.getElementById("myiframe1").contentWindow.document.getElementById("lot_name:").innerText;
            	document.getElementById("lot_name").innerHTML= lot_name;
            	
            	year_time = document.getElementById("myiframe1").contentWindow.document.getElementById("year_time:").innerText;
            	document.getElementById("year_time").innerHTML= year_time;
            	
            	post_time = document.getElementById("myiframe1").contentWindow.document.getElementById("post_time:").innerText;
            	document.getElementById("post_time").innerHTML= post_time;
            	
            	source_from = document.getElementById("myiframe1").contentWindow.document.getElementById("source_from:").innerText;
            	document.getElementById("source_from").innerHTML= source_from;
            	
            	label = document.getElementById("myiframe1").contentWindow.document.getElementById("label:").innerText;
            	document.getElementById("label").innerHTML= label;
            	
            	size = document.getElementById("myiframe1").contentWindow.document.getElementById("size:").innerText;
            	document.getElementById("size").innerHTML= size;
        	}
        	if(situation=="1"){
        		 alert("该拍品已被签出！！！不再提供签约的权限！！")
        	}
        	if(situation=="2"){
       		 alert("拍品库暂时无此拍品！！")
       	}
        	
        }catch(e){
            //捕获错误
        }
    })

</script>
</body>
</html>