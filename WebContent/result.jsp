<%@ page language="java" import="java.util.*,java.sql.*" 
         contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="com.user.*"%>
<%@ page language="java" import="com.Lot.*"%>
<%@ page language="java" import="com.contact.*"%>
<% request.setCharacterEncoding("utf-8");%>

<%
//contact element:

	String pid = request.getParameter("pid");

//	lot element:
	String lot_id = "";
	String lot_name = "";
	String year_time = "";
	String post_time = "";
	String source_from = "";
	String label = "";
	String size = "";
	Integer situtation = null;
	String price = "";
	String pay_method = "";
	String picker = "";
	String picker_email = "";
	String pick_date = "";

	
//searchlot session.getAttribute("LIST"); 
	lot_id = (String)session.getAttribute("lotId");
   lot_name = (String)session.getAttribute("lotName");
   year_time = (String)session.getAttribute("yearTime");
   post_time = (String)session.getAttribute("postTime");
   source_from = (String)session.getAttribute("sourceFrom");
   label = (String)session.getAttribute("labelInfo");
   size = (String)session.getAttribute("sizeInfo");
  String situation =  (String)session.getAttribute("situation");
  System.out.println("situation: "+situation);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p id="lot_id:"><%= lot_id%></p>
<p id="lot_name:"><%= lot_name%></p>
<p id="year_time:"><%= year_time%></p>
<p id="post_time:"><%= post_time%></p>
<p id="source_from:"><%= source_from%></p>
<p id="label:"><%= label%></p>
<p id="size:"><%= size%></p>
<p id="situation:"><%= situation%></p>
</body>
</html>