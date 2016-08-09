<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.vis.vo.PaymentBean" %>
<%@ page import="com.vis.vo.CancelBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSSs/table.css" rel="stylesheet">
<title>Insert title here</title>
</head>



<body>
<%@include file="Header.jsp" %>
<br><br>

<%if(request.getAttribute("list")!=null)
	{%>
<table class="zui-table zui-table-highlight zui-table-horizontal" width="65%" border="1" align="center">
		<tr>
			<th>Policy ID</th>
			<th>Vechicle Number</th>
			<th>Model</th>
			<th>Due Amount</th>
			<th>Next Due Date</th>
			<th>Action</th>
		</tr>

    <%
    	SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
 	  	List<PaymentBean> paylist;
		paylist=(List<PaymentBean>)session.getAttribute("list");
        for(PaymentBean obje:paylist)
        {
        	Date date1 = new Date(obje.getDueDate().getTime());
        	Date date2 = new Date();
        	long daydif = (date1.getTime()-date2.getTime())/(1000*60*60*24);
	%>
        	<tr>
        		<td><%=obje.getPolicyId()%></td>
        		<td><%=obje.getVehiclnumber()%></td>
        		<td><%=obje.getVehiclemodel()%></td>
        		<td><%=obje.getAmount()%></td>
        		<td><%=obje.getDueDate()%></td>
        	<%if(daydif<32)
        	{%>
        		<td><a href="Singleobj.jsp?val=<%=obje.getPolicyId()%>"><input type="button" value="Pay Premium"></a></td>
        	<%
        	}
        	else
        	{%>
        		<td><input type="button" disabled="disable" value="Pay Premium"></td>
        	<%
        	}%>
        	</tr>
	<% } 
	%>
     </table>  	 
	<%
	}
	%>
    
    
 <%if(request.getAttribute("cancellist")!=null){
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
	List<CancelBean> cancellist;
	cancellist=(List<CancelBean>)session.getAttribute("cancellist");
        for(CancelBean obje:cancellist)
        {
        	Date date = new Date(obje.getVehicleRegReqTime().getTime());
	%>
        	<tr>
        		<td align="center"><%=obje.getPolicyId()%></td>
        		<td align="center"><%=obje.getOwnerName()%></td>
        		<td align="center"><%=obje.getVehicleRegistrationState()%></td>
        		<td align="center"><%=obje.getVehicleType()%></td>
        		<td align="center"><%=obje.getUsage()%></td>
        		<td align="center"><%=obje.getManufacturer()%></td>
        		<td align="center"><%=obje.getModel()%></td>
        		<td align="center"><%=obje.getEngineNumber()%></td>
        		<td align="center"><%=obje.getYearMake()%></td>
        		<td align="center"><%=obje.getRegisteringLocation()%></td>
        		<td align="center"><%=sdf.format(date.getTime())%>
        		<td align="center"><%=obje.getPrice()%></td>
        		<td align="center"><a href="Singleobj.jsp?canclepid=<%=obje.getPolicyId()%>"><input type="button" value="Cancel"></a></td>
        	</tr>
	<% } 
	%>
</table>	 
	<%}
	%>
 
   		

</body>
</html>