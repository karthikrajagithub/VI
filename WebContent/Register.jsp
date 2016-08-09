<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSSs/jquery-ui.css" rel="stylesheet">
<script src="Scripts/jquery-1.10.2.js"></script>
<script src="Scripts/jquery-ui.js"></script>
<script type="text/javascript" src="Scripts/Date.js"></script> 
<script type="text/javascript" src="Scripts/login.js"></script> 

<body>
<%@ include file="Header.jsp" %>
<br>
<center><h5><%if(request.getAttribute("errMsg")!=null)
	 {%>
	 <%=request.getAttribute("errMsg") %>
	<% }
	 %></h5></center>
	<center><h4>Registration</h4></center>
	<form action="RegistrationController" name="reg" id="usradd" onsubmit="return validateRegister()" method="post">
	<table align="center">
 	
 	
 	<tr><td>First Name</td><td><input type="text" name="firstname" maxlength="20" autocomplete="off" pattern="[a-zA-Z ].{4,20}"   required title="Minimum 5 letters & maximum 20 letters"></td></tr>
 	<tr><td>Last Name</td><td><input type="text" name="lastname" maxlength="20" autocomplete="off" pattern="[a-zA-Z ].{4,20}"   required title="Minimum 5 letters & maximum 20 letters"></td></tr>
 	<tr><td>Password</td><td><input type="password" name="password" maxlength="20" autocomplete="off" pattern="((?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@#$%!]).{8,20})"   required title="Atleast One Capital letter, One small letter, One number and one Special character among @#$%!"></td></tr>
 	<tr><td>Confirm Password</td><td><input type="password" name="confirmpassword" autocomplete="off" required></td></tr>
 	<tr><td>Gender</td><td>
 			<input type="radio" name="gender" value="male" checked> Male<br>
   		    <input type="radio" name="gender" value="female"> Female</td></tr>
	<tr><td>Contact Number</td><td><input type="text" name="phone" maxlength="10"  autocomplete="off" pattern="[7-9]{1}[0-9]{9}"   required title="Valid Ten Digit Mobile number"></td></tr>
 	<tr><td>Email Id</td><td><input type="text" name="emailid" maxlength="35" autocomplete="off" pattern="(?=.*[@])(?=.*[.]).{8,35}$"   required title="Valid e-mail ID length 8-35"></td></tr>
  	<tr><td>Date Of Birth</td><td><input type="text" id="ramkie"  name="dop" required ></td></tr>
			
	<tr><td>Address</td><td><textarea rows="6" cols="20" name="address" form="usradd" maxlength="20" autocomplete="off" pattern="[a-zA-Z ].{4,20}"   required title="Minimum 5 letters & maximum 20 letters"></textarea></td></tr>
 	<tr><td>City</td><td><input type="text" name="city" maxlength="20" autocomplete="off" pattern="[a-zA-Z ].{4,20}"   required title="Minimum 5 letters & maximum 20 letters"></td></tr>
  	<tr><td>State</td><td><input type="text" name="state" maxlength="20" autocomplete="off" pattern="[a-zA-Z ].{4,20}"   required title="Minimum 5 letters & maximum 20 letters"></td></tr>
 	<tr><td>Country</td><td><input type="text" name="country" maxlength="20" autocomplete="off" pattern="[a-zA-Z ].{4,20}"   required title="Minimum 5 letters & maximum 20 letters"></td></tr>
 	<tr><td>Pincode</td><td><input type="text" name="pincode" maxlength="6" autocomplete="off" pattern="[0-9].{5,5}"   required title="Valid 6 digit pincode"></td></tr>
	<tr><td></td><td><input type="submit" value="Register"></td><td><input type="reset" value="reset"></td></tr>
	</table>
	</form>
	
	
</body>
</html>