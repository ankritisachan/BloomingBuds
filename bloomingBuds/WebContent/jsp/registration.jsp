<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTRATION</title>
 <link rel="stylesheet" type="text/css" href="/bloomingBuds/css/comstyle.css">
<!--  < script type="text/javascript">
 function display(){
	 alert("You are registered successfully. Userid and password will be provided on your email after verification.")
 }
 
 
 </script -->
</head>
<body style="background-image: url('/bloomingBuds/image/background.jpg'); background-repeat:no-repeat ">
<div style=" height: 1000px;width: 1000px;margin: auto;">
<div style=" height: 240px;width: 1000px;">
<%@ include file="/html/comheader.html" %></div>

<div style=" height: 1050px;width: 1000px;background-color: lightgreen;margin-top: 10px">
<div style="background-color: white;width: 100%;height: 100px;float: left;"><h1 style="text-align: center;font-family: Algerian;padding-top: 10px">REGISTRATION FORM</h1></div>
<div style="background-color: white;width: 90%;height: 180px;margin-left: 50px;margin-top: 25px;float:left;border: 2px;border-style: solid">
<h2 style="text-align: left;color: navy;font-style: Britannic;padding-left: 20px;"><u>Instructions</u>:</h2>
<ul type="disc">
<li>All fields are compulsory.</li>
<li>Draft is required before Registration for draft number.</li>
<li>Age limit for kid is 3-10 years.</li>
<li> Enter correct Email-Id to get further information.</li>
</ul>

</div>


<div style="background-color: lightpink;width:45%;height: 700px;float: left;margin-left: 270px;margin-top: 25px">
<form  method="post", action="/bloomingBuds/Registration">
<table  align=center width="100%" height="700px">
<tr style="background-color: white"><th>Name:</th><td style="text-align: center;"><input type="text" name="kname" id="kname"  required="required" ></td></tr>
<tr style="background-color: white"><th>Address:</th><td style="text-align: center;"><input type="text" name="kadd" id="kadd" required="required"></td></tr>
<tr style="background-color: white"><th>Email-Id:</th><td style="text-align: center;"> <input type="email" name="kmail" id="kmail"  required="required"></td></tr>
<tr style="background-color: white"><th>Phone No.:</th><td style="text-align: center;"><input type="number" name="kphone" id="kphone"  required="required"></td></tr>
<tr style="background-color: white"><th>Gender:</th><td style="text-align: center;"><input type="radio" name="kgen" id="kmale" value="male" >Male<input type="radio" name="kgen" id="kfemale" value="female">Female</td></tr>
<tr style="background-color: white"><th>Mother's Name:</th><td style="text-align: center;"><input type="text" name="mother" id="mother" required="required"></td></tr>
<tr style="background-color: white"><th>Father's Name:</th><td style="text-align: center;"><input type="text" name="father" id="father" required="required"></td></tr>
<tr style="background-color: white"><th>School Name:</th><td style="text-align: center;"><input type="text" name="school" id="school" required="required" ></td></tr>
<tr style="background-color: white"><th>Draft No.:</th><td style="text-align: center;"><input type="text" name="draft" id="draft" required="required"></td></tr>
<tr style="background-color: white"><th>Date:</th><td style="text-align: center;"><input type="date" name="date" id="date" required="required"></td></tr>
<tr><td colspan="2" style="text-align: center;"><button type="submit" >SUBMIT</button></td></tr>
</table>




</form>


</div>
</div ><div style=" height: 120px;width: 1000px;margin-top: 15px">
<%@ include file="/html/footer.html" %></div>

</div>



</body>
</html>