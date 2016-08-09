<%@page import="com.vis.vo.PaymentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body background="Images/gate.jpg"  onload="javascript:window.history.forward(1);">

<%
PaymentBean bean=(PaymentBean)session.getAttribute("bean"); 
%>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<form action="DirectPaymentController" method="post">
<table align="center">
<tr><td>Select Bank</td><td><select name="bankname">
							<option value="SBI">SBI</option>
							<option value="HDFC">HDFC</option>
							<option value="AXIS">AXIS</option>
							<option value="SBH">SBH</option>
							<option value="CITI">CITI</option>
							<option value="HSBC">HSBC</option>
							</select></td></tr>
<tr><td>Login ID</td><td><input type="text" name="loginid" autocomplete="off" required>
<tr><td>Password</td><td><input type="password" name="pass" autocomplete="off" required>
<tr><td></td><td><table><tr><td><input type="submit" value="Proceed"name="sub"></td><td><input type="reset"></td></tr></table></td></tr>
</table>

</form>
</body>
</html>