<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@page import="java.sql.SQLException"%>
<%@page import="bloomingBuds.dbinfo.Dboperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,bloomingBuds.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Information</title>
</head>
<body>
<%String ctid=request.getParameter("ctuserid");%>
<table width="100%" height="300px" border="1">
<%try{
String que="select * from caretaker where userid=?";
ResultSet rs=Dboperation.getData(que,ctid);
if(rs.next()){%>

<tr><th>Caretakerid</th><th>Name</th><th>Address</th><th>Phone No.</th><th>Email</th><th>Gender</th><th>Kid's Id</th></tr>

<tr><td><%=rs.getString("userid") %></td><td><%=rs.getString("name") %></td><td><%=rs.getString("address") %></td><td><%=rs.getLong("phoneno") %></td>
<td><%=rs.getString("email")%></td><td><%=rs.getString("gender") %></td>
<td>
<%
String query="select userid from kidregistration where caretakerid=?";
ResultSet rs2=Dboperation.getData(query, ctid);
while(rs2.next()){
%>
<h4><%=rs2.getString("userid") %>,</h4><%} %></td></tr> 


<%}}
catch(SQLException se){
System.out.println(se);}

%>

</table>
</body>
</html>