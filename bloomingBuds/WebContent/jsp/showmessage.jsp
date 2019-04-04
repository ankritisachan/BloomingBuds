<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,bloomingBuds.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Message</title>
</head>
<body>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
</div>
<div style="background-color: #FFC0CB;width: 1000px;height: 850px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">Message</h1>
</div>
<%
ResultSet rs = null;
HttpSession hs = request.getSession(false);
String user=(String)hs.getAttribute("log");
if(user==null||hs.isNew())
{
	 request.setAttribute("msg", "not authorised user pls do login");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response); 
	
}
else{
int id = Integer.parseInt(request.getParameter("msid"));
System.out.println("id"+id);
String strsq = "select subject,msgtext from message where msgid=?";
rs = Dboperation.getData(strsq, id);
try{
while(rs.next())
{
%>
<p><%=rs.getString("subject") %>
<p><%=rs.getString("msgtext") %>
<% }
}
catch(SQLException se){
	System.out.println(se);
	}
}
%>
</body>
</html>