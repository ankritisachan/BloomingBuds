<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONTACT US</title>
<link rel="stylesheet" type="text/css" href="/bloomingBuds/css/style.css">
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat ">
<div style="height: 1000px;width: 1000px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<div style=" width: 100%;height: 1000px;background-color: lightpink;margin-top: 5px">
<% String msg=(String)request.getAttribute("key");
if(msg!=null){%><h2 style="text-align: center;color: blue"><%=msg %></h2><%} %>
<div style="background-color: white;width:80%;height:200px;float: left;margin-left: 100px;margin-bottom: 10px;margin-top: 80px; border-style:solid;border-color: purple;">
<h2 style="font-family:Tw Cen MT;color: gray;text-decoration: underline;text-align: center; "> CONTACTS US:</h2>
<table align="center" width="60%" height="30px">
<tr><th style="color:navy ;">Address:</th><td style="text-align: center;">A-78 ,Kamla Nagar,Agra</td></tr>
<tr><th style="color:navy ;">Telephone:</th><td style="text-align: center;">8864894360,9695893694</td></tr>
<tr><th  style="color:navy;">E-mail:</th><td style="text-align: center;">bb.123@gmail.com</td></tr>
</table>
</div>
<div style="background-color: white;width: 80%;height: 500px;float: left;margin-left: 100px;margin-bottom: 10px;margin-top: 20px;border-style: solid;border-color: purple">
<h2 style="font-family:Tw Cen MT;color: gray;text-decoration: underline;text-align: center; "> ENQUIRY FORM:</h2>
<form method="post" action="/bloomingBuds/Contact">
<table align="center" width="45%" height="80px" >
<tr><th style="color:navy;">Name:</th><td style="text-align: left;"><input type="text" name="name" id="name" required="required" ></td></tr>
<br><tr><th style="color:navy;">E-mail:</th><td style="text-align:left;"><input type="email" name="email" id="email" required="required" ></td></tr>
<tr><th style="color:navy;">Phone:</th><td style="text-align: left;"><input type="number" name="phone" id="phone" required="required" ></td></tr>
<tr><th style="padding-bottom: 225px;color:navy; ">Enquiry:</th><td style="text-align: left;"><textarea name="text" id="text" rows="15" cols="50"></textarea></td></tr>
<tr><td colspan="2" align="center"><button type="submit">SUBMIT</button>
</table>






</form>

</div>


</div><div style="margin-top: 5px"><%@ include file="/html/footer.html" %>
</div>

</div>
</body>
</html>