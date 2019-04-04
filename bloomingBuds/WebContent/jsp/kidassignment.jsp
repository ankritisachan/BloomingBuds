<%@page import="bloomingBuds.dbinfo.Dboperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,bloomingBuds.dbinfo.Dboperation"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Kids</title>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<h4 style="text-align: right;"><a href="/bloomingBuds/Logout">Logout</a></h4>
</div>
<div style="background-color: #FFC0CB;width: 1000px;height: 1000px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">ASSIGN KIDS</h1>
</div>
<%String data=(String)request.getAttribute("info");
if(data!=null){
%>
<h3 style="color: blue;text-align: center"><%=data %></h3><%} %>
<% ResultSet rs,rkid = null;
HttpSession hs = request.getSession(false);
String user=(String)hs.getAttribute("log");
if(user==null||hs.isNew())
{
	 request.setAttribute("msg", "not authorised user pls do login");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response); 
	
}
else{
	String strsql ="select userid,totalkids from caretaker where totalkids<5";
	String kid = "select userid,assignstatus from kidregistration where status=? and assignstatus=? and caretakerid=? and userid is not null";
	
	rs = Dboperation.getData(strsql);
	System.out.println(rs);
	rkid = Dboperation.getData(kid,"true" ,"not assigned", "none");
	System.out.println(rkid);
	%>
	<div style="margin-left: 400px">
	<form method="post" action="/bloomingBuds/KidAssignment">
	<table>
	<tr><td>Select Caretaker: </td>
	<td><select name="caretaker">
	<option value="def">select caretaker</option>
<%
try{
while(rs.next())
{
%>
<option value="<%=rs.getString("userid")%>"><%=rs.getString("userid") %>,kids-<%=rs.getInt("totalkids") %></option>
<%} %>
</select></td>
</tr>
<%
}
catch(SQLException se){
System.out.println(se);
}
finally{
	rs.close();
}
%>
</table>
<br>
<br>
<br>
<table border="1px">
<tr>
<td>Select</td><td>Kids Id</td><td>Assigned Status</td>
</tr>
<%try{
while(rkid.next()){
	%>
	<tr>
	<td><input type="checkbox" name="kid" value="<%=rkid.getString("userid")%>"></td><td><%=rkid.getString("userid") %></td><td><%=rkid.getString("assignstatus") %></td>
	</tr>
<%
}}
catch(SQLException s){
System.out.println(s);
}
finally{
	rkid.close();
} }
%>
<tr><td></td><td><button type="submit">Submit</button> </td></tr>
</table>
	</form>
	</div>
	</div>
	<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>