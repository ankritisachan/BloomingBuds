<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CARETAKER PROFILE</title>
</head>
<body  style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat ">
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");%>
<%
if(uid==null||hs.isNew()){
	request.setAttribute("msg", "not authorized user");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response);
}%>
<div style=" height: 1000px;width: 1000px;margin: auto;">
      <div style=" height: 240px;width: 1000px;">
       <%@ include file="/html/comheader.html" %></div>
   
      
      
       <div style="background-color:#FFEFD5;    width:1000px; height:450px; margin-top:10px" >
       <div style="width:50px; height:100px; margin-left:500px;margin-top: 5px">
       <img src="/bloomingBuds/image/login.jpg" style="margin-top: 20px; margin-left:180px">
       </div>
       <ul type="circle">
       <li ><h4>To View Your Profile click on-<a href="/bloomingBuds/jsp/view.jsp">View Profile</a></h4></li>
       
       <li><h4>To Edit Your Profile click on-<a href="/bloomingBuds/jsp/edit.jsp">Edit Profile</a></h4></li>
       <li><h4>To View The Information Of Kids click on-<a href="/bloomingBuds/jsp/kidinfo.jsp">Kid's Information</a></h4></li>
        <li ><h4>To view your inbox click on-<a href="/bloomingBuds/jsp/inbox.jsp">Inbox</a></h4></li>
       <li ><h4>To view your compose click on-<a href="/bloomingBuds/jsp/compose.jsp">Compose</a></h4></li>
   <li ><h4>To view your sentitems list click on-<a href="/bloomingBuds/jsp/sentitem.jsp">Sentbox</a></h4></li>
    <li ><h4>To view and add activity click on-<a href="/bloomingBuds/jsp/activity.jsp">Activity</a></h4></li>
   <li ><h4>To Logout-<a href="/bloomingBuds/Logout">Logout</a></h4></li>
       </ul>
      </div>
      
      
      
      
      <div style="margin-top: 10px">
      <%@ include file="/html/footer.html" %>
      </div>
</div>
</body>
</html>