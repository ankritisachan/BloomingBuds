<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Activity</title>
</head>

<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<h4 style="text-align: right;"><a href="/bloomingBuds/Logout">Logout</a></h4>
</div>
<div style="background-color: #FFC0CB;width: 1000px;height: 350px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">ADD Activity</h1>
</div>
<body>
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<%
String data=(String)request.getAttribute("info");
if(data!=null)
{%>
<h3 style="color: darkred;text-align: center"><%=data %></h3>
<% }%>
<%
HttpSession hs = request.getSession(false);
String user=(String)hs.getAttribute("log");
if(user==null||hs.isNew())
{
	 request.setAttribute("msg", "not authorised user pls do login");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response); 
	
}
else{
%>
<div>
<form  method="post" action="/bloomingBuds/Activity">
<table>
<tr><td><br></td></tr>
<tr><th>Activity Name</th>
<td><textarea rows="7" cols="100" name="activ"></textarea></td>
</tr>
<tr><th>Date</th><td><input type="date" name="date" id="date"></td></tr>
<tr><td></td><td><button type="submit">Submit</button></td></tr>
</table>
</form>
</div>
</div>
<%}%>
<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>