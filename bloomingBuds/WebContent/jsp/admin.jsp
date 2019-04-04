<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN</title>
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
<div style="background-color: white;width: 1000px;height: 700px;margin-left:167px;margin-top: 55px;float: left">

<div style="background-color: white;width: 60%;height: 500px;margin-left: 50px;margin-top: 50px;float:left;border: 2px;">

<ul type="disc">
 <li ><h4><a href="/bloomingBuds/jsp/registeredkids.jsp">View Registered Kids</a></h4></li>
 <li ><h4><a href="/bloomingBuds/jsp/viewcaretaker.jsp">View Caretaker profile</a></h4></li>
  <li ><h4><a href="/bloomingBuds/jsp/verifydraft.jsp">Verify Draft</a></h4></li>
   <li ><h4></a>Create Account for----</h4></li>
<ol>
  <li ><h4><a href="/bloomingBuds/jsp/createuser.jsp"> parent</a></h4></li>
   <li ><h4><a href="/bloomingBuds/jsp/akcaretaker.jsp">caretaker</a></h4></li></ol>
   <li ><h4><a href="/bloomingBuds/jsp/kidassignment.jsp"> Assignment of Kids to caretaker</a></h4></li>
   <li ><h4><a href="/bloomingBuds/jsp/inbox.jsp">Inbox</a></h4></li>
   <li ><h4><a href="/bloomingBuds/jsp/compose.jsp">Compose</a></h4></li>
   <li ><h4><a href="/bloomingBuds/jsp/sentitem.jsp">Sentbox</a></h4></li>
   <li ><h4><a href="/bloomingBuds/jsp/upload.jsp">Upload</a></h4></li>
   <li><h4><a href="/bloomingBuds/jsp/notif.jsp">Update Notifications</a></h4></li>
   <li><h4><a href="/bloomingBuds/jsp/showactivity.jsp">View Activity</a></h4></li>
   <li><h4><a href="/bloomingBuds/jsp/showquery.jsp">View User's Query</a></h4></li>
   <li><h4><a href="/bloomingBuds/Logout">Logout</a></h4></li>
   
    </ul>
    </div>
    </div>
   <div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
<% } %>
</body>
</html>