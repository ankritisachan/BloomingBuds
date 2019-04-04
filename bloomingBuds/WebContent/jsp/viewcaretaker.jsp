<%@page import="java.sql.SQLException"%>
<%@page import="bloomingBuds.dbinfo.Dboperation"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Caretaker Profile</title>
<script type="text/javascript">
function showkids(ctid){
	var x;
	/*  alert(ctid);  */
if(XMLHttpRequest){
	x=new XMLHttpRequest();
}	
else{
	x=new ActiveXObject("Microsoft.XMLHTTP");
}	
	x.onreadystatechange=function(){
		if(x.readyState==4 && x.status==200){
			var data=x.responseText;
			/* alert(data); */
			document.getElementById("divid").innerHTML=data;
		}
	}
	
x.open("get","/bloomingBuds/jsp/ctkid.jsp?ctuserid="+ctid,"true");
x.send();
	
}

</script>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<h4 style="text-align: right;"><a href="/bloomingBuds/Logout">Logout</a></h4>
</div>
<div style="background-color: #FFC0CB;width: 1000px;height: 750px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">CARETAKER INFORMATION</h1>
</div>
<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");%>
<%
if(uid==null||hs.isNew()){
	request.setAttribute("msg", "not authorized user");
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
<div style="height: 200px;width: 1000px;float: left;margin-top: 50px ;text-align: center">
<% try{
String query="select userid,name from caretaker";
ResultSet rs=Dboperation.getData(query);
%>
<h3 style="color: green">Select Caretaker:</h3>
<select name="ctcombo" onchange="showkids(this.value)">

<option value="default">select caretaker</option>
<% 
while(rs.next()){%>
	<option value="<%=rs.getString("userid")%>"><%=rs.getString("name") %>-<%=rs.getString("userid") %></option>
	
	
<%} %>


</select>
<%}
catch(SQLException se){
System.out.println(se);
}

%>
</div>


<%} %>

<div style="background-color: white;width: 1000px;height: 300px;float: left;" id="divid"></div>




</div>
 <div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>