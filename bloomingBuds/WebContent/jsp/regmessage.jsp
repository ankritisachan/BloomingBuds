<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTRATIONINFO</title>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
</div>
<div style="background-color: white;width:1000px;height: 300px;margin-left:167px;margin-top: 55px;float: left">
<% String info=(String)request.getAttribute("info");
%><h3 style="color: blue;padding-top: 80px;text-align: center;"><%=info %></h3>
</div>
<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
</body>
</html>