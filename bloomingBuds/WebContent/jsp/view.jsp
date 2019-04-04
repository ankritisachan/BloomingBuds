<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,bloomingBuds.dbinfo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view</title>
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat ">
<input id="alwaysFetch" type="hidden" />
<script>
    setTimeout(function () {
        var el = document.getElementById('alwaysFetch');
        el.value = el.value ? location.reload() : true;
    }, 0);
</script>
<% HttpSession hs=request.getSession(false);
String uid=(String)hs.getAttribute("log");%>




<div style=" height: 1000px;width: 1000px;margin: auto;">
 <div style=" height: 240px;width: 1000px;">
 <%@ include file="/html/comheader.html" %>
 <h4 style="text-align: right;"><a href="/bloomingBuds/Logout">Logout</a></h4></div>
 <div style="width:1000px; height: 100px; background-color: white;margin-top: 10px;">
 <h1 style="text-align: center;color:black;font-family:Algerian;padding-top: 25px">VIEW PAGE</h1>
 </div>
       
 <div style="width:1000px; height:500px;background-color: lightgreen;margin-top: 0px">
 <%if(uid==null||hs.isNew()){
	 request.setAttribute("msg", "not authorized user");
	 RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	 rd.forward(request,response);
 }
 else{
	 String strsql="select * from caretaker where userid=?";
	 ResultSet rs=Dboperation.getData(strsql,uid);
	 try{
		 if(rs.next()){
			 %>
			 <div style="width: 45%;height: 300px;margin-left: 300px;margin-top: 100px;float: left;background-color: white;border: 1px;border-style: solid">
			 <table  width="100%" height="300px">
			 <tr><th>Name:</th><td><%=rs.getString("name") %></td></tr>
			<tr><th>Address:</th><td><%=rs.getString("address") %></td></tr>
			<tr><th>Email:</th><td><%=rs.getString("email") %></td></tr>
			<tr><th>Phone:</th><td><%=rs.getString("phoneno") %></td></tr>
			<tr><th>Gender:</th><td><%=rs.getString("gender") %></td></tr>
			
						
						
			 </table> 
			    
			  </div>
			 
		<%  }
	 }catch(SQLException e){
		System.out.println(e);
	 }
	 finally{
		 rs.close();
	 }
	 
 }%>
 
       
</div>
<div style="width:1000px;height: 120px;margin: auto;margin-top: 10px "><%@ include file="/html/footer.html" %></div>
 </div>
</body>
</html>