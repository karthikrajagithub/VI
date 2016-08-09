<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	int adminid=0;
	String fname = null;
	if(session.getAttribute("adminid")!=null && session.getAttribute("adminid")!="")
		{
		adminid=Integer.parseInt(session.getAttribute("adminid").toString()); 
		fname = session.getAttribute("adminname").toString();
		}
		%>
		<center><table>
	<tr><td> <img src="Images/Logo.jpg" alt="India Insurance Logo" height="125" width="140"> </td><td><h1><font face="Algerian" size="15" color="#086A87">India Insurance Co.Ltd</font></h1>
	</td></tr></table></center>
	<%
	if(adminid!=0)
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
			<tr><td><a href="Login.jsp"> <img src="Images/Login.jpg" alt="Login" height="35" width="140"> </a></td></tr>
		</table>
	<%}
	%>
	<hr>
	<center>
	<table>
			<tr><td><a href="AdminHome.jsp"> <img src="Images/Home.jpg" alt="Home" height="35" width="140"> </a></td><td></td>
			</tr>
	</table>
	</center>
	
	 <table align="left">
	
			<%if(adminid!=0)
				{%>
					<tr><td><a href="VehicleRegAdminController"><img src="Images/Insurance Processing.jpg" alt="Insurance Processing" height="50" width="140"></a></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td><a href="ClaimAdminList"><img src="Images/Accident.jpg" alt="Accident Claim Processing" height="50" width="140"></a></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td><a href="ClaimAdminTheft"><img src="Images/Theft.jpg" alt="Theft Claim Processing" height="50" width="140"></a></td></tr>
					<tr><td></td></tr>
					<tr><td></td></tr>
					<tr><td><a href="AdminCancel.jsp"><img src="Images/Cancel Policy.jpg" alt="Cancle Processing" height="50" width="140"></a></td></tr>
				<%} %>
	</table>

</body>
</html>