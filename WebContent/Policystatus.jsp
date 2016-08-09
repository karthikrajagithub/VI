<%@page import="com.vis.vo.ClaimBean"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Status of Claim</title>
</head>
<body>
   <%@include file="Header.jsp" %>
<center>
<h3>
<%if(request.getAttribute("accId")!=null)
	{%>
	Your claim request for Accident was accepted.<br> Your Acknowledgment number is "
	<%=request.getAttribute("accId") %>"
	<%
	}%>
	
	<%if(request.getAttribute("theftId")!=null)
	{%>
	Your claim request for Theft was accepted.<br> Your Acknowledgment number is "
	<%=request.getAttribute("theftId") %>"
	<%
	}%>
</h3>
</center>
</body>
</html>