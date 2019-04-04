<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,bloomingBuds.dbinfo.Dboperation" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Download</title>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
%>
</head>

<!-- <script type="text/javascript">
function showupload(id){
	var x;
	if(XMLHttpRequest){
		x=new XMLHttpRequest();
	}
	else{
		x=new ActiveXObject("Microsoft.XMLHttp");
	}
	
	x.onreadystatechange = function(){
		if(x.readyState==4&& x.status==200)
		{
			var data=x.responseText;
			alert(data);
		}
		
	}
	x.open("get","/bloomingBuds/jsp/upload.jsp?userid="+id,"true");
	x.send();
	
}

</script> -->

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
<div style="background-color: lightgreen;width: 1000px;height: 850px;margin-left:167px;margin-top: 55px;float: left">


<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">DOWNLOADS</h1>
</div>
<%
HttpSession hs=request.getSession();
String uid=(String)hs.getAttribute("log");
%>

<div style="background-color: white;width: 60%;height: 300px;float: left;margin-top: 50px;margin-left: 200px ">
<form method="post" action="/bloomingBuds/Download" >

<table border=1 width="100%" height="300px">
<tr><th>Upload-id</th><th>Title</th><th>File name</th><th>download file</th></tr>
<%try{
	String query="select uploaded,title,filename from uploads where userid=?";
	ResultSet rs=Dboperation.getData(query, "admin@");
	if(rs!=null){
		while(rs.next()){%>
		
		
	<tr><td><%=rs.getString("uploaded") %></td>
	<td><%=rs.getString("title") %></td><td><%=rs.getString("filename") %></td>
	<td><a href="/bloomingBuds/admin@/<%=rs.getString("filename")%>">download</a></td></tr>
			
		<%}
	}
	
	
}
catch(SQLException se){
	System.out.println(se);
}
%>

</table>
</form>


</div>


</body>
</html>