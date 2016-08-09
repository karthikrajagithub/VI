<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vis.vo.CancelBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="Scripts/Valid.js"></script>
<link href="CSSs/table.css" rel="stylesheet">
</head>

<body>
<%@include file="Header.jsp" %>
<br><br><br>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	CancelBean canclebean = (CancelBean)session.getAttribute("cancelbean");
	Date date = new Date(canclebean.getLastPremiumTime().getTime());
%>
<form action="CancelControllerUpdate" method="post">
<table align="center">
		<tr>
			<td>Policy Id</td><td>:</td><td><%=canclebean.getPolicyId()%></td>
		</tr>
        <tr>
        	<td>Owner Name</td><td>:</td><td><%=canclebean.getOwnerName()%></td>
        </tr>
        <tr>
        	<td>Vehicle Number</td><td>:</td><td><%=canclebean.getVehicleNumber()%></td>
        </tr>
        <tr>
        	<td>Registration State</td><td>:</td><td><%=canclebean.getVehicleRegistrationState()%></td>
        </tr>
        <tr>		
        	<td>Manufacturer</td><td>:</td><td><%=canclebean.getManufacturer()%></td>
        </tr>
        <tr>		
        	<td>Model</td><td>:</td><td><%=canclebean.getModel()%></td>
        </tr>
       	<tr>	
       		<td>Year Make</td><td>:</td><td><%=canclebean.getYearMake()%></td>
       	</tr>
        <tr>		
        	<td>Last Premium Paid on</td><td>:</td><td><%=sdf.format(date.getTime())%>
        </tr> 
		<tr>
			<td>Total Premium Paid</td><td>:</td><td><%=canclebean.getTotalPremiumPaid() %></td>
		</tr>
		<%
//		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		Date date1 = new Date(canclebean.getVehicleRegReqTime().getTime());
		Date date2 = new Date();
		long daysdiff = date2.getTime()-date1.getTime();
		daysdiff = daysdiff/(1000*60*60*24);
		if(daysdiff<=60)
			{
			%>
			<tr>	
				<td>Refund amount on cancel </td>
				<td>:</td>
				<td><%=(int)(canclebean.getTotalPremiumPaid()-(canclebean.getTotalPremiumPaid()*0.07))%></td>
			</tr>
			<%
			}
		else if(daysdiff<=120)
			{
			%>
			<tr>	
				<td>Refund amount on cancel </td>
				<td>:</td>
				<td><%=(int)(canclebean.getTotalPremiumPaid()-(canclebean.getTotalPremiumPaid()*0.1025))%></td>
			</tr>
			<%
			}
		else if(daysdiff<=180)
			{
			%>
			<tr>	
				<td>Refund amount on cancel </td>
				<td>:</td>
				<td><%=(int)(canclebean.getTotalPremiumPaid()-(canclebean.getTotalPremiumPaid()*0.1235))%></td>
			</tr>
			<%
			}
		else
		{
			%><tr>	
				<td>Refund amount on cancel </td>
				<td>:</td>
				<td><%=0.00%></td>
			</tr>
			<%
		}
		%>
			<tr>	
			<td><input type="submit" onClick="return payconfirm()" Value = "Confirm Cancel"></td>
			<td></td>
			<td><a href="Home.jsp"><input type = "button" onClick="return payconfirm()" value = "Return Home"></td>
			</tr> 
	
		
			</table>
</form>

</body>
</html>