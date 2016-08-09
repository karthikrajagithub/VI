<%@page import="com.vis.vo.PaymentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vehicle Insurance</title>
</head>
<%--background="Images/sky.jpg"* --%>
<body>
<% 
	int custid=0;
	String fname = null;
	if(session.getAttribute("custid")!=null && session.getAttribute("custid")!="")
		{
		custid = Integer.parseInt(session.getAttribute("custid").toString()); 
		fname = session.getAttribute("fname").toString();
		}
		%>
		<center><table>
	<tr><td> <img src="Images/Logo.jpg" alt="Vehicle Insurance Logo" height="125" width="140"> </td><td><h1><font face="Algerian" size="15" color="#086A87">VEHICLE INSURANCE PVT LTD</font></h1>
	</td></tr></table></center>
	<%
	if(custid!=0)
	{%>
		<table align="right">
		<tr>
			<td>Hi,  <%=fname %></td>
			<td><a href="Logout.jsp"> <img src="Images/Logout.jpg" alt="Logout" height="35" width="140"> </a></td></tr>
		</table>
	<%}
	else
	{%>
		<table align="right">
		<tr><td>Welcome Guest</td></tr>
			<tr><td><a href="Login.jsp"> <img src="Images/Login.jpg" alt="Login" height="35" width="140"> </a></td>
			<td><a href="Register.jsp"> <img src="Images/Register.jpg" alt="Register" height="35" width="140"> </a></td></tr>
		</table>
	<%}
	%>
	<hr>
	<center>
	<table>
			<tr><td><a href="Home.jsp"> <img src="Images/Home.jpg" alt="Home" height="35" width="140"> </a></td><td></td>
			<td><a href="Aboutus.jsp"> <img src="Images/Aboutus.jpg" alt="About us" height="35" width="140"> </a></td><td></td>
			<td><a href="Contact.jsp"> <img src="Images/Contact.jpg" alt="Contact" height="35" width="140"> </a></td><td></td>
			<%if(custid==0)
				{%><td><a href="DirectPayNew.jsp"> <img src="Images/PayPremium.jpg" alt="Pay Premium" height="35" width="200"> </a></td>
				<%}%></tr>
	</table>
	</center>
	
	 <table align="left">
	
			<%if(custid!=0)
				{%>
					<tr><td><a href="VehicleRegistration.jsp"> <img src="Images/VehicleRegistration.jpg" alt="Vehicle Registration" height="35" width="140"> </a></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td><a href="RegisteredPayController"> <img src="Images/PayPremium.jpg" alt="Pay Premium" height="35" width="140"> </a></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td><a href="ClaimController"> <img src="Images/ClaimPolicy.jpg" alt="Claim Policy" height="35" width="140"> </a></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td><a href="CancelUserController"> <img src="Images/CancelPolicy.jpg" alt="Cancel Policy" height="35" width="140"> </a></td></tr>
				<%} %>
	</table>

</body>
<HEAD>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
</HEAD>
</html>