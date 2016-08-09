<%@page import="com.vis.vo.ClaimBean"%>
<%@page import="com.vis.vo.VehicleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vis.vo.CancelBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSSs/table.css" rel="stylesheet">
<script type="text/javascript" src="Scripts/Valid.js"></script>
</head>

<body>
	<%@include file="AdminHeader.jsp" %>
	<br><br><br>
<table class="zui-table zui-table-highlight zui-table-horizontal" width="65%" border="1" align="center">
<%if(request.getAttribute("errMsg")!=null)
{
%>
		<center>
		<b><font face="Aharoni" size="3"><%=request.getAttribute("errMsg") %></font></b>
		<br>
		<a href="AdminHome.jsp"> <input type="button" value="Go Home"></a>
		</center>
<%
}
else if(request.getAttribute("vehiclelist")!=null)
	{
			String str = "Approve";
			String str1 = "Reject";
			List<VehicleBean> list = (List<VehicleBean>)session.getAttribute("vehiclelist");
			%><tr><th>Request ID</th>
					<th>Customer ID</th>
					<th>Owner Name</th>
					<th>Registration Number</th>
					<th>Usage</th>
					<th>Action</th>
				</tr>
			<%for(VehicleBean obj:list)
				{
			%>
					<tr>
						<td><%=obj.getRequestNO() %></td>
						<td><%=obj.getCustId() %></td>
						<td><%=obj.getOwnerName() %></td>
						<td><%=obj.getVehicleRegistrationNumber() %></td>
						<td><%=obj.getUsage() %></td>
						<td><a href="Redirect.jsp?reqno=<%=obj.getRequestNO()%>&val=<%=str%>"><input type="button"  onClick="return payconfirm()" value="Approve"></a><br><br>
						<a href="Redirect.jsp?reqno=<%=obj.getRequestNO()%>&val=<%=str1%>"><input type="button"  onClick="return payconfirm()" value="Reject"></a></td>
					</tr>
			<%
				}
	}


else if(request.getAttribute("cancelamount")!=null)
{
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	CancelBean canclebean = (CancelBean)session.getAttribute("cancelbean");
	Date date = new Date(canclebean.getLastPremiumTime().getTime());
%>
<form action="CancelUpdate" method="post">
<table align="center">
		<tr>
			<td>Policy ID</td><td>:</td><td><%=canclebean.getPolicyId()%></td>
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
			<td><input type="submit"  onClick="return payconfirm()" Value = "Confirm Cancel"></td>
			<td></td>
			<td><a href="AdminHome.jsp"><input type = "button" value = "Return Home"></a></td>
			</tr> 
		
			</table>
</form>

	<% 
}
else if(request.getAttribute("adminclaimlist")!=null)
	{
		
	%>
	<center><br><br><h3>Accident Request</h3></center>
	<%	
		String str = "Approve";
		String str1 = "Reject";
		List<ClaimBean> list = (List<ClaimBean>)session.getAttribute("acclist");
		%><tr><th>Acknowledgment ID</th>
				<th>Policy ID</th>
				<th>Customer ID</th>
				<th>Vehicle Number</th>
				<th>Insured Amount</th>
				<th>Accident Type</th>
				<th>Date of Accident</th>
				<th>Action</th>
			</tr>
		<%for(ClaimBean obj:list)
			{
		%>
				<tr>
					<td align="center"><%=obj.getAcknowledgeId() %></td>
					<td><%=obj.getPolicyId() %></td>
					<td><%=obj.getCustId() %></td>
					<td><%=obj.getVehicleRegNumber() %></td>
					<td><%=obj.getPrice() %></td>
					<td><%=obj.getType() %></td>
					<td><%=obj.getDateOfAccident() %></td> 
					<td align="center"><a href="Redirect1.jsp?accno=<%=obj.getPolicyId()%>&val=<%=str%>"><input type="button"  onClick="return payconfirm()" value="Approve"></a><br><br>
					<a href="Redirect1.jsp?accno=<%=obj.getPolicyId()%>&val=<%=str1%>"><input type="button"  onClick="return payconfirm()" value="Reject"></a></td>
				</tr>
		<%
			}
		
		
	}
else if(request.getAttribute("admin1")!=null)
{%>
<center><br><br><h3>Theft Request</h3></center>
<%
		
	String str = "Approve";
	String str1 = "Reject";
	List<ClaimBean> list = (List<ClaimBean>)session.getAttribute("theftlist");
	%><tr><th>Acknowledgment ID</th>
			<th>Policy ID</th>
			<th>Customer ID</th>
			<th>Vehicle Number</th>
			<th>Insured Amount</th>
			<th>Date of Theft</th>
			<th>Date of Complaint</th>
			<th>FIR Number</th>
			<th>Police Station</th>
			<th>Action</th>
		</tr>
	<%for(ClaimBean obj:list)
		{
	%>
			<tr>
				<td align="center"><%=obj.getTheftAcknowledgeId() %></td>
				<td><%=obj.getPolicyId() %></td>
				<td><%=obj.getCustId() %></td>
				<td><%=obj.getVehicleRegNumber() %></td>
				<td><%=obj.getPrice() %></td>
				<td><%=obj.getDateOfTheft() %></td>
				<td><%=obj.getDateofcomplaint() %></td> 
				<td><%=obj.getFirNo() %></td>
				<td><%=obj.getPoliceStationBranch() %></td>
				<td align="center"><a href="Redirect1.jsp?tefno=<%=obj.getPolicyId()%>&val=<%=str%>"><input type="button"  onClick="return payconfirm()" value="Approve"></a><br><br>
				<a href="Redirect1.jsp?tefno=<%=obj.getPolicyId()%>&val=<%=str1%>"><input type="button"  onClick="return payconfirm()" value="Reject"></a></td>
			</tr>
	<%
		}
	
	
}
%>
</table>
</body>
</html>