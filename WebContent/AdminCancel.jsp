<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@ page import="com.vis.vo.CancelBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="CSSs/table.css" rel="stylesheet">
</head>

<body>
<%@include file="AdminHeader.jsp" %>
	<br><br><br>
<center>

<form action="CancelAdminController" method="post">
<table>
<tr><td>Enter PolicyID</td><td></td>
	<td><input type="text" name = "policyid" required></td>
	<td></td>
	<td><input type="submit" value="Get Details"></td>
</tr>
</table>
</form>
<br><br><br>
</center>

<%if(request.getAttribute("admincancle")!=null)
{
%>
		<table class="zui-table zui-table-highlight zui-table-horizontal" width="65%" border="1" align="center">
		<tr>
			<th>Policy ID</th>
			<th>Owner Name</th>
			<th>Registration State</th>
			<th>Type</th>
			<th>Usage</th>
			<th>Manufacturer</th>
			<th>Model</th>
			<th>Engine Number</th>
			<th>Year of make</th>
			<th>Registering Location</th>
			<th>Date of Insurance</th>
			<th>Price of Vehicle</th>
			<th>Action</th>
		</tr>
	<%
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	CancelBean cancelbean;
	cancelbean=(CancelBean)session.getAttribute("cancleadmin");
        	Date date = new Date(cancelbean.getVehicleRegReqTime().getTime());
	%>
        	<tr>
        		<td><%=cancelbean.getPolicyId()%></td>
        		<td><%=cancelbean.getOwnerName()%></td>
        		<td><%=cancelbean.getVehicleRegistrationState()%></td>
        		<td><%=cancelbean.getVehicleType()%></td>
        		<td><%=cancelbean.getUsage()%></td>
        		<td><%=cancelbean.getManufacturer()%></td>
        		<td><%=cancelbean.getModel()%></td>
        		<td><%=cancelbean.getEngineNumber()%></td>
        		<td><%=cancelbean.getYearMake()%></td>
        		<td><%=cancelbean.getRegisteringLocation()%></td>
        		<td><%=sdf.format(date.getTime())%>
        		<td><%=cancelbean.getPrice()%></td>
        		<td><a href="Redirect.jsp?canclepid=<%=cancelbean.getPolicyId()%>"><input type="button"  value="Cancel"></a></td>
        	</tr>
</table>	 
<%
}%>

</body>
</html>