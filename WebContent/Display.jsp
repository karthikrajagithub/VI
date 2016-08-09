
<%@page import="com.vis.vo.ClaimBean"%>

<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Policy Details</title>
<%@ include file="Header.jsp" %>
<link href="CSSs/table.css" rel="stylesheet">
</head>
<br><br>
<body>

<form action="Claim.jsp" >
<table class="zui-table zui-table-highlight zui-table-horizontal" width="65%" border="1" align="center">

<%!ClaimBean bean;
 	   ArrayList<ClaimBean> list;
	%>
	<tr><th>Policy ID</th>
		<th>Registration Number</th>
		<th>Name</th>
		<th>Vehicle Registered State</th>
		<th>Type Of Vehicle</th>
		<th>Premium Amount</th>
		<th>Action</th>
	</tr>
	<%
		list=(ArrayList<ClaimBean>)session.getAttribute("list");
        for(ClaimBean obj:list)
        {
	%>
	
        	<tr>
        	  	<td><%=obj.getPolicyId() %></td>
        	  	<td><%=obj.getVehicleRegNumber()%></td>
        		<td><%=obj.getOwnerName()%></td>
        		<td><%=obj.getVehicleRegState()%></td>
        		<td><%=obj.getVehicleType()%></td>
        		<td><%=obj.getPremiumAmount()%></td>    		
        		 <td><!-- <input type="submit" name="claim" > -->
        		 <a href="Claim.jsp?id=<%=obj.getPolicyId() %>&vno=<%=obj.getVehicleRegNumber()%>"><input type="button" value="Claim"></a>
        		 
        		 </td>
        	</tr>

<% } 
    %>
</table>

</form>
</body>
</html>