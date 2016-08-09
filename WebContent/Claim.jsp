<%@ page import="java.util.*" %>
<%@page import="com.vis.vo.ClaimBean"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Claim Page</title>
</head>
<body>
    <%@include file="Header.jsp" %>
<br><br>
<center>
<%
ClaimBean bean=(ClaimBean)session.getAttribute("accidnt") ;

	String id=request.getParameter("id");
	String vehiclenumber = request.getParameter("vno");
	session.setAttribute("selected",id);
	%><table><tr><td>Policy ID</td><td>:</td><td><%=id %></td></tr>
			<tr><td>Registration Number</td><td>:</td><td><%=vehiclenumber %></td></tr>	
	
	</table> <%
	
	%></center>
	<center><table>       	
<tr><td><form action="ClaimcController" method="post">
<input type="submit" value="Accidental Calim"><br>
</form></td>
<td><form action="ClaimdController" method="post">
<input type="submit" value="Theft Claim">
</form></td></tr>
</table>
</center>
</body>
</html>