<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.vis.vo.ClaimBean"%>
<%@page import="com.vis.vo.VehicleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.vis.vo.CancelBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="Scripts/Valid.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="CSSs/table.css" rel="stylesheet">
</head>
<body>



<table class="zui-table zui-table-highlight zui-table-horizontal" width="65%" border="1" align="center">
<%if(session.getAttribute("theftlist")!=null)
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
					<td align="center"><a href="Redirect1.jsp?tefno=<%=obj.getPolicyId()%>&val=<%=str%>"><input type="button"  onClick="return payconfirm()" value="Approve"></a><br>
					<a href="Redirect1.jsp?tefno=<%=obj.getPolicyId()%>&val=<%=str1%>"><input type="button"  onClick="return payconfirm()" value="Reject"></a></td>
				</tr>
		<%
			}
		
		
	}
%>


</table>




</body>
</html>