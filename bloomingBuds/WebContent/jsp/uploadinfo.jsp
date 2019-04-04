<%@page import="bloomingBuds.dbinfo.Dboperation"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Info</title>
</head>
<body>
<%-- <div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
</div>
<div style="background-color: lightgreen;width: 1000px;height: 850px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">UPLOADS</h1>
</div> --%>
<%-- <%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");
String msg=(String)request.getAttribute("info");
if(msg!=null){%><h3 style="color: blue;text-align: center;"><%=msg %></h3><%} %>
<%
if(uid==null||hs.isNew()){
	request.setAttribute("msg", "not authorized user");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response);
}
else{%> --%>
<% String userid=request.getParameter("userid") ;%>
<form method="post" action="/bloomingBuds/Deleteupload">
<table border=1 width="100%" height="300px">
<tr><th>Select</th><th>Upload-id</th><th>Title</th><th>File name</th></tr>
<%try{
	String query="select uploaded,title,filename from uploads where userid=?";
	ResultSet rs=Dboperation.getData(query, userid);
	if(rs!=null){
		while(rs.next()){%>
		
		
	<tr><td><input type="checkbox" name="chkbox" value="<%=rs.getString("uploaded") %>"></td><td><%=rs.getString("uploaded") %></td>
	<td><%=rs.getString("title") %></td><td><%=rs.getString("filename") %></td></tr>
			
		<%}
	}
	
	
}
catch(SQLException se){
	System.out.println(se);
}
%>
<tr><td colspan="4" style="text-align: center"><button type="submit">Delete</button></td></tr>

</table>

</form>


</div>
</body>
</html>
