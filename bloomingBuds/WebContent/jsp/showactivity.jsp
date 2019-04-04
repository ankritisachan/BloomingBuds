<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,bloomingBuds.dbinfo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Activity</title>
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
<h1 style="text-align: center;font-family: Algerian">View Activity</h1>
</div>
<div style="background-color: white;width: 90%;height: 700px;margin-top: 60px;float: left;margin-left: 70px">

<% 
if(uid==null||hs.isNew()){
 	 request.setAttribute("msg", "not authorized user");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	 rd.forward(request,response); 
 }
 else { %>
 
 <form>
<table  width="100%" height="700px">

<%
try
{
	String str="select activityid,activity, date from activity order by activityid desc limit 10";
	ResultSet rs=Dboperation.getData(str);
	while(rs.next())
	{
	 %>
			 
	 <tr><th>Activity Id:</th><td><%=rs.getString("activityid") %></td><th>Activity name:</th><td><%=rs.getString("activity") %></td>
	<th>Date:</th><td><%=rs.getString("date") %></td></tr>
		
<% 	}
	
}
catch(SQLException se)
{
	System.out.println(se);
}

} %>

</table>
</form>
</div>
</div>
<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>