<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
//contact element:

	String cus_id = request.getParameter("pid");
	String cus_name = (String)session.getAttribute("cus_name");
	String cus_rank = (String)session.getAttribute("cus_rank");
	String cus_phone = (String)session.getAttribute("cus_phone");
	String cus_count = (String)session.getAttribute("cus_count");
	String cus_totalPrice = (String)session.getAttribute("cus_totalPrice");
	
	System.out.println("get_cus_id: "+cus_id);
	System.out.println("get_cus_name: "+cus_name);
	System.out.println("get_cus_rank: "+cus_rank);
	System.out.println("get_cus_phone: "+cus_phone);
	System.out.println("get_cus_count: "+cus_count);
	System.out.println("get_cus_totalPrice: "+cus_totalPrice);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p id="cus_id:"><%= cus_id%><br></p>
<p id="cus_name"><%= cus_name%><br>
<p id="cus_rank"><%= cus_rank%><br>
<p id="cus_phone"><%= cus_phone%><br></p>
<p id="cus_count"><%= cus_count%><br>
<p id="cus_totalPrice"><%= cus_totalPrice%><br>
</body>
</html>