<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOGIN</title>
<link rel="stylesheet" type="text/css" href="/ebooking/css1/style.css">
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat ">
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<div style="width: 1000px;height: 1000px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<div style=" width: 100%;height: 700px;background-color: buttonface;">
<div  style=" width: 100%;height: 100px;background-color:white;"><h1 style="text-align: center;font-family:  Algerian;padding-top: 25px">LOGIN PORTAL</h1></div>
<%String info=(String)request.getAttribute("msg");
if(info!=null){%><h3 style="text-align: center;color: red"><%=info %></h3><%} %>
<div style="background-color:white;width: 35%;height: 400px;float:left;margin-left: 330px;margin-right: 300px;margin-top: 80px;margin-bottom: 400px;border-style:groove;border-radius:5px;">
<div style="width:48%;height:150px;float: left;margin-left: 90px;margin-right: 20px">
<img  src="/bloomingBuds/image/loginn.jpg" style="width: 100%;height: 160px">
</div>
<div style="width:100%;height:200px;float:left;margin-top: 80px">
<form method="post" action="/bloomingBuds/Login">
<table  align="center">

<tr><td >Userid:</td><td ><input type="text" name="txtid" id="name" required="required" placeholder="enter  username"></td></tr>
<tr><td>Password:</td><td><input type="password" name="txtpass" id="password" required="required" placeholder="enter password"></td></tr>

<tr><th colspan="2" align="center"><button type="submit">LOGIN</button></th></tr>
<tr><td  colspan="2" align="center"> <h4 style="text-align: center;">New to Blooming Buds?</h4></td></tr>
<tr><td colspan="2" align="center"><a href="/bloomingBuds/jsp/registration.jsp">Create your Account</a></td></tr>
</table>



</form>


</div>



</div>

</div>

<div style="position: absolute;left:190px;width: 1000px;margin-top: 10px"><%@ include file="/html/footer.html" %></div>
</div>


</body>
</html>