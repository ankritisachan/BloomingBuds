<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"      import="java.sql.*,bloomingBuds.dbinfo.*"%>                               
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view registered kids</title>
</head>
<body>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<% HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");%>
<input id="alwaysFetch" type="hidden" />
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
<h1 style="text-align: center;font-family: Algerian">KID'S INFORMATION</h1>
</div>
<div style="background-color: white;width: 1000px;height: 700px;margin-top: 60px;float: left;">
<% if(uid==null||hs.isNew()){
	 request.setAttribute("msg", "not authorized user");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	 rd.forward(request,response);
 }
 else{%>
<form >
<table  border="1" width="1000px" height="700px" bordercolor="purple" >
<tr style="color: green"><th>Reg.id</th><th>Name</th><th>Father's name</th><th>Email</th><th>Phone No.</th><th>Gender</th>
<th>Address</th><th>Date</th><th>Assignstatus</th><th>Caretaker-Id</th></tr>
<%
try{
	String selq="select regid,name,fathername,email,phoneno,gender,address,date,assignstatus,caretakerid from kidregistration";
	ResultSet rs=Dboperation.getData(selq);
	while(rs.next()){%>
	
	<tr><th><%=rs.getInt("regid") %></th><th><%=rs.getString("name") %></th><th><%=rs.getString("fathername") %></th>
	<th><%=rs.getString("email") %></th><th><%=rs.getLong("phoneno") %></th><th><%=rs.getString("gender") %></th><th><%=rs.getString("address") %></th>
	<th><%=rs.getString("date") %></th>
	<th><%=rs.getString("assignstatus") %></th><th><%=rs.getString("caretakerid") %></th></tr>	
	<% }}
	catch(SQLException se){
		System.out.println(se);
	}	
	%>
</table>
</form>
<%} %>
</div>
</div>
<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>