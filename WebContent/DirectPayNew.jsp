<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="Scripts/Valid.js"></script> 
</head>
<body>
<%@include file="Header.jsp" %>
<br><br><br>
<%-- onsubmit="return form_validation()" --%>
<form action="DirectPaymentControllerNew" method="post" >
<table align="center">
<tr><td>Policy ID</td>
	<td><input type="text"  name="policyid" maxlength="8" required ><span style="color:red;" id="error" > </span></td> </tr>
<tr><td></td>
	<td><table><tr><td><input type="submit" value="Get Details" name="sub"></td><td><input type="reset"></td></tr></table></td></tr>
</table>

</form>





</body>
</html>