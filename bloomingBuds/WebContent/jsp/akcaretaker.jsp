<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="bloomingBuds.dbinfo.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assignment Of Kids</title>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
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
<div style="background-color: #FFC0CB;width: 1000px;height: 500px;margin-left:167px;margin-top: 55px;float: left">
<% String info=(String)request.getAttribute("verify");
if(info!=null){%>
<h3 style="text-align: center;color: blue"><%=info %></h3><%} %>
<%
HttpSession hs = request.getSession(false);
String user=(String)hs.getAttribute("log");
if(user==null||hs.isNew())
{
	 request.setAttribute("msg", "not authorised user pls do login");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response); 
	
}
else{ %>
<div style="background-color: white;height: 300px;width: 40%;float: left;margin-left:300px;margin-top: 80px">
<form method="post" action="/bloomingBuds/CTaccount">
<table  align="center" width="100%" height="300px">
<tr><th>USERID-</th><td><input type="text" name="ctid" id="ctid" required="required"></td></tr>
<tr><th>PASSWORD-</th><td><input type="text" name="ctpassword" id="ctpass" required="required"></td></tr>
<tr><td colspan="2" style="text-align: center;"><button type="submit">SUBMIT</button>
</table>



</form>

</div>
	
<%} %>

</div>
<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>