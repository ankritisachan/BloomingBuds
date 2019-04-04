<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload</title>
<script type="text/javascript">
function showupload(id){
	var x;
	/*  alert(id);  */
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
	
x.open("get","/bloomingBuds/jsp/uploadinfo.jsp?userid="+id,"true");
x.send(); 
	
}




</script>
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
<div style="background-color: lightgreen;width: 1000px;height: 850px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">UPLOADS</h1>
</div>
<%
HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");
String msg=(String)request.getAttribute("info");
if(msg!=null){%><h3 style="color: blue;text-align: center;"><%=msg %></h3><%} %>
<%
if(uid==null||hs.isNew()){
	request.setAttribute("msg", "not authorized user");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response);
}
else{%>
<div style="background-color: white;width: 40%;height: 150px;float: left;margin-top: 50px;margin-left: 300px ">
<form method="post" action="/bloomingBuds/Upload" enctype="multipart/form-data">
<table width="100%" height="100px">
<tr><th>Select File:</th><td><input type="file" name="fileup"required="required"></td></tr>
<tr><th>Title:</th><td><input type="text" name="title" required="required"></td></tr>

<tr><td colspan="2" style="text-align: center"><button type="submit">Upload</button></td></tr>


</table>

</form>
<table align="center"><tr><td style="text-align: center"><button type="button" onclick="showupload('admin@')">View Uploaded File</button></td></tr></table>
</div>















<%} %>
<div style="background-color: white;width: 1000px;height: 300px;float: left; margin-top: 30px" id="divid"></div></div>

 <div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>

</div>
</body>
</html>