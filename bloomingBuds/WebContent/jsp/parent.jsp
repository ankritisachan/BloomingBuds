<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kid's Account</title>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<%HttpSession hs = request.getSession(false);
String user=(String)hs.getAttribute("log");
if(user==null||hs.isNew())
{
	 request.setAttribute("msg", "not authorised user pls do login");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response); 
	
}
else{%>
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
</div>
<div style="background-color: #FFC0CB;width: 1000px;height: 540px;margin-left:167px;margin-top: 55px;float: left">

<div style="background-color: white;width: 60%;height: 315x;margin-left: 50px;margin-top: 50px;float:left;border: 2px;border-style: solid">

<ul type="disc">
 <li ><h4>To view your profile click on-<a href="/bloomingBuds/jsp/pview.jsp">View Profile</a></h4></li>
 <li ><h4>To edit your profile click on-<a href="/bloomingBuds/jsp/pedit.jsp">Edit Profile</a></h4></li>
  <li ><h4>To view your inbox click on-<a href="/bloomingBuds/jsp/inbox.jsp">Inbox</a></h4></li>
   <li ><h4>To comose mail click on-<a href="/bloomingBuds/jsp/compose.jsp">Compose</a></h4></li>
   <li ><h4>To view your sentbox click on-<a href="/bloomingBuds/jsp/sentitem.jsp">Sentbox</a></h4></li>
   <li ><h4>To Download click on-<a href="/bloomingBuds/jsp/pdownload.jsp">Download</a></h4></li>
    <li ><h4>To view activity click on-<a href="/bloomingBuds/jsp/showactivity.jsp">View Activity</a></h4></li>
    <li ><h4>To Logout-<a href="/bloomingBuds/Logout">Logout</a></h4></li>
    </ul>
    </div>
    </div>
   <div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
<%} %>
</body>
</html>