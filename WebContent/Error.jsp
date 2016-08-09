<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>



<body>
<%@include file="Header.jsp" %>
<br><br>

<center>
	<b><font face="Aharoni" size="3"><%=request.getAttribute("errMsg") %></font></b>
	<br>
	<a href="Home.jsp"> <input type="button" value="Go Home"></a>
</center>
</body>
</html>