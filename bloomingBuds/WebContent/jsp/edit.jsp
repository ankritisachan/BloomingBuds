<%@page import="java.sql.SQLException"%>
<%@page import="bloomingBuds.dbinfo.Dboperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit profile</title>
</head>



<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat ">
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>

<div style="width: 1000px;height: 1000px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<h4 style="text-align: right;"><a href="/bloomingBuds/Logout">Logout</a></h4>
<div style=" width: 100%;height: 500px;background-color: buttonface;">
<div  style=" width: 100%;height: 100px;background-color:white;"><h1 style="text-align: center;font-family:  Algerian;padding-top: 25px">EDIT PROFILE</h1></div>
<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");%>
<%
if(uid==null||hs.isNew()){
	request.setAttribute("msg", "not authorized user");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response);
}
else{
	String strsql="select address,email,phoneno from caretaker where userid=?";
ResultSet rs=Dboperation.getData(strsql,uid);
try{
	if(rs.next()){%>
		<div style="margin-top: 100px;background-color: white;border: 1px;border-style: solid;width: 35%;height: 130px;margin-left: 330px;padding-top: 20px">
		<form method="post" action="/bloomingBuds/Edit">
			<table align="center" >
			<tr><th>Address:</th><td><input type="text" name="ctaddress" value="<%=rs.getString("address")%>"></td></tr>
			<tr><th>Email:</th><td><input type="text" name="ctemail" value="<%=rs.getString("email")%>"></td></tr>
			<tr><th>Phone:</th><td><input type="number" name="ctphone" value="<%=rs.getLong("phoneno")%>"></td></tr>
			
			<tr><td colspan="2" style="text-align: center"><button type="submit" >UPDATE</button></td></tr>
		</table>
		</form>
		</div>
	<% }
	}
	catch(SQLException se){
		System.out.println(se);
	}
finally{
	rs.close();
}
}%>
</div>
 <div style="width:1000px;height: 120px;margin-top:5px ;float: left; "><%@ include file="/html/footer.html" %></div>
</div>

</body>
</html>