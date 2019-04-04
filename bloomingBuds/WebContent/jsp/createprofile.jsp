<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CREATE PROFILE</title>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat">
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<%HttpSession hs = request.getSession(false);
String user=(String)hs.getAttribute("log");
if(user==null||hs.isNew())
{
	 request.setAttribute("msg", "not authorised user pls do login");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request, response); 
	
}
else{%>
<div style="width:1000px;height: 200px;margin: auto;">
<%@ include file="/html/comheader.html" %>
<h4 style="text-align: right;"><a href="/bloomingBuds/Logout">Logout</a></h4>
</div>
<div style="background-color: #FFC0CB;width: 1000px;height: 850px;margin-left:167px;margin-top: 55px;float: left">
<div style="background-color: white;width: 100%;height: 100px;float: left;">
<h1 style="text-align: center;font-family: Algerian">CREATE PROFILE</h1>
</div>
<div style="background-color: white ;width: 45%;height: 600px;margin-left: 290px;float: left;margin-top: 50px;border: 1px;border-style: solid">
<form method="post"  action="/bloomingBuds/Createprofile">
<table  align="center" width=100% height="600px""">
<tr><th>Userid:</th><td style="text-align: center;"><input type="text" name="userid" id="userid" required="required"></td></tr>
<tr><th>Name:</th><td style="text-align: center;"><input type="text" name="name" id="name" required="required"></td></tr>
<tr><th>Address:</th><td style="text-align: center;"><textarea rows="5" cols="35" name="ctaddress" id="ctaddress"></textarea></td></tr>
<tr><th>Email:</th><td style="text-align: center;"><input type="email" name="cemail" id="cemail" required="required" ></td></tr>
<tr><th>Phone No.:</th><td style="text-align: center;"><input type="number" name="cphone" id="cphone" required="required"></td></tr>
<tr><th>Gender:</th><td style="text-align: center;"><input type="radio" name="kgen" id="kmale" value="male">Male<input type="radio" name="kgen" id="kfemale" value="female">Female</td></tr>
<tr><td colspan="2" style="text-align: center;"><button type="submit">SUBMIT</button></td></tr>
</table>




</form>
</div></div>
<div style="margin-top: 10px;width: 1000px;height: 120px;float: left;margin-left: 167px">
<%@ include file="/html/footer.html" %>
</div>
<%} %>
</body>
</html>