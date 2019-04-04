<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,bloomingBuds.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View User's Query</title>
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
<div style="background-color: #FFC0CB;width: 1000px;height: 750px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">USER QUERIES</h1>
</div>
<div style="background-color: white;width: 70%;height: 500px;margin-top: 60px;float: left;margin-left: 150px">
 <%
 
 HttpSession hs = request.getSession(false);
 String user=(String)hs.getAttribute("log");
 if(user==null||hs.isNew()){
	 request.setAttribute("msg", "not authorized user");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	 rd.forward(request,response);
 }
 else{%> 
<table border=2 width="100%" height="500px">
<tr><th>EnquiryId</th><th>Name</th><th>Email</th><th>Phone No.</th><th>Query</th></tr>
<%
String query="select * from enquiry";
ResultSet rs=Dboperation.getData(query);
if(rs!=null){
	while(rs.next()){%>
		<tr><td><%=rs.getInt("enquiryid") %></td><td><%=rs.getString("name") %></td><td><%=rs.getString("email") %></td><td><%=rs.getLong("phone") %></td>
		<td><%=rs.getString("enquiry") %></td></tr>
		
		
	<%}
}%>

</table><%} %>
</div></div>
<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>