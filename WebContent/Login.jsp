<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>siri</title>
</head>

<script type="text/javascript" src="Javascripts/login.js"></script>  

<body onload="javascript:window.history.forward(1);">
<%@ include file="Header.jsp" %>
<br><br>

<form action="LoginController" name="log" onsubmit="return validateLogin()" method="post">

<center><h1>Login Details</h1></center>
 
<table align="center">


	<tr><td>Login ID</td><td><input type="text" name="login" maxlength="10" autocomplete="off" required=""></td></tr>
	
	<tr><td>Password</td><td><input type="password" name="password" autocomplete="off" required=""></td></tr>
	
	<tr><td>User Type</td><td>
	<input type="radio" name="userType" value="customer" checked>customer<br>
	<input type="radio" name="userType" value="admin">admin</td></tr>
	
	<tr><td></td><td><input type="submit" value="login"></td></tr>
	
 </table> </form>
 <center><h5><%if(request.getAttribute("errMsg")!=null)
	 {%>
	 <%=request.getAttribute("errMsg") %>
	<% }
	 %></h5></center>

</body>
</html>