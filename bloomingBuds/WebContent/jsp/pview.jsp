<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,bloomingBuds.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>KID PROFILE</title>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<% HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");%>
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<h4 style="text-align: right;"><a href="/bloomingBuds/Logout">Logout</a></h4>
</div>
<div style="background-color: #9ACD32 ;width: 1000px;height: 900px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">KID'S PROFILE</h1>
</div>
<div style="background-color: white;width: 70%;height: 700px;margin-top: 60px;float: left;margin-left: 150px">
<% if(uid==null||hs.isNew()){
	 request.setAttribute("msg", "not authorized user");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	 rd.forward(request,response);
 }
else{%>
<form>
<table  width="100%" height="700px">
<% try{
String strsql="select regid, name, address, email, phoneno, gender, mothername, fathername, schoolname, draftno, date, status, assignstatus, caretakerid from kidregistration where userid=?";
ResultSet rs=Dboperation.getData(strsql, uid);
if(rs.next()){%>
<tr><th>Registration-Id:</th><th><%=rs.getInt("regid") %></th></tr>
<tr><th>Name:</th><th><%=rs.getString("name") %></th></tr>
<tr><th>Address:</th><th><%=rs.getString("address") %></th></tr>
<tr><th>Email:</th><th><%=rs.getString("email") %></th></tr>
<tr><th>Phone No.:</th><th><%=rs.getLong("phoneno") %></th></tr>
<tr><th>Gender:</th><th><%=rs.getString("gender") %></th></tr>
<tr><th>Mother's Name:</th><th><%=rs.getString("mothername") %></th></tr>
<tr><th>Father's Name:</th><th><%=rs.getString("fathername") %></th></tr>
<tr><th>School Name :</th><th><%=rs.getString("schoolname") %></th></tr>
<tr><th>Draft No.:</th><th><%=rs.getString("draftno") %></th></tr>
<tr><th>Date:</th><th><%=rs.getString("date") %></th></tr>
<tr><th>Status:</th><th><%=rs.getString("status") %></th></tr>
<tr><th>Assign Status:</th><th><%=rs.getString("assignstatus") %></th></tr>
<tr><th>Caretaker-Id:</th><th><%=rs.getString("caretakerid") %></th></tr>

<%}}
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