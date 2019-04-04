<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,bloomingBuds.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HOME</title>
<link rel="stylesheet" type="text/css" href="/bloomingBuds/css/styleA.css">
<script type="text/javascript">
var arr= new Array(3);
arr[0]="/bloomingBuds/image/logo.png";
arr[1]="/bloomingBuds/image/bbuds.jpg";
arr[2]="/bloomingBuds/image/roseday.jpg";
var idx=0;
function changeImage(){
	document.getElementById("movImg").src=arr[idx];
	idx++;
	if(idx>2)
		idx=0;
	setTimeout("changeImage()", 1500);
}
</script>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat "; onload="changeImage()">
   <div id="outer">
   <div id="header">
   <%@ include file="/html/header.html" %>
    </div>
    <div id="menu">
    <ul>
       <li><a href="/bloomingBuds/jsp/home.jsp">HOME</a></li>
       <li><a href="/bloomingBuds/html/aboutus.html">ABOUT US</a></li>
       <li><a href="/bloomingBuds/html/gallery.html">GALLERY</a></li>
       <li><a href="/bloomingBuds/jsp/registration.jsp">SIGN UP</a></li>
       <li><a href="/bloomingBuds/jsp/login.jsp">SIGN IN</a></li>
       <li><a href="/bloomingBuds/jsp/contactus.jsp">CONTACT US</a></li>
    </ul>
    </div>
    <div id="body">
    <div id ="img">
    <img src="/bloomingBuds/image/bb.jpg" id="movImg">
    </div>
    <div style="height: 300px; width: 1000px">
    <div id="vid">
    <video style="width: 550px; height: 300px" src="/bloomingBuds/video/video.mp4" loop="loop" autoplay="autoplay" controls="controls"> </video></div>
    <div id ="mot">
    <pre style="font:italic; font-size:20px ; font-family:Matura MT Script Capitals; color: black; ">
  Someone once said -
      "Step with care and great tact, 
           and remember that 
                 Life's a Great Balancing Act."
                  
  We this thought, we bring the best in your child...
  
  Our Motto - 
     Loving lessons in confidence, 
         growth and compassion provided!
                                          </pre>
    </div>
    </div>
    <div id="notif">
    <h3 style="font-family: cursive;">Notifications</h3>
    <marquee direction="up" height="120px" width="950px">
    <%Connection con = Dboperation.createConnection();
    String strnf="select notification from notif order by notifid desc limit 10";
    PreparedStatement ps = con.prepareStatement(strnf);
    ResultSet rs = ps.executeQuery();
    while(rs.next())
    {%>
    <ul>
    <li><%=rs.getString("notification") %></li>
    </ul>
    <%}%>
    </marquee>
    </div>
    </div>
    <div id="footer">
    <%@include file= "/html/footer.html"%>
    </div>
  </body>
</html>