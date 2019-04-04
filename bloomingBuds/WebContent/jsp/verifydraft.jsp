<%@page import="java.sql.SQLException"%>
<%@page import="bloomingBuds.dbinfo.Dboperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Draft</title>

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
<div style="background-color: #FFC0CB;width: 1000px;height: 850px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">Verify Draft </h1>
</div>
<%String data=(String)request.getAttribute("info");
if(data!=null){
%>
<h3 style="color: blue;text-align: center"><%=data %></h3><%} %>
<%
ResultSet rs=null;
HttpSession hs=request.getSession(false);
String user=(String)hs.getAttribute("log");
if(user==null||hs.isNew())
{
	 request.setAttribute("msg", "not authorised user pls do login");
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
		rd.forward(request, response); 
}


else{
String strsql="select regid,name,draftno,status from kidregistration where status=?";

rs = Dboperation.getData(strsql, "false");
%>
<div style="background-color: white ;width: 45%;height: 500px;margin-left: 290px;float: left;margin-top: 50px;border: 1px;border-style: solid">
<form method="post" action="/bloomingBuds/Varify">
<table border="1" align="center">
<tr>
<th>Select</th><th>Registration Id</th><th>Name</th><th>Draft No</th><th>Status</th>
</tr>
<%
try{
while(rs.next())
{
%>
<tr><th><input type="checkbox" name="chkbox" value="<%=rs.getInt("regid")%>"></th>
<td><%=rs.getInt("regid") %>
<td><%=rs.getString("name") %></td>
<td><%=rs.getInt("draftno") %></td>
<td><%=rs.getString("status") %></td>


</tr>
<%}
}
catch(SQLException se)
{
System.out.println(se);
}
finally{
	rs.close();
}
}
%>
<tr><td colspan="5" align="center"><button type="Submit">Verify</button></td></tr>
</table>
</form>
</div>
</div>

<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>