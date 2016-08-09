<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<% response.setHeader("Cache-Control","no-cache"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setDateHeader ("Expires", 0); //prevents caching at the proxy server  
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%--if(request.getSession(false) == null)
{
	response.sendRedirect("Home.jsp");
}--%>
<%--
try
{
--%>




<body onload="javascript:window.history.forward(1);">
<%@include file="Header.jsp" %>
<br><br>
<form>
<%! PaymentBean bean;%>
<% bean=(PaymentBean)session.getAttribute("bean");%>

<table align="center">
<tr><td>Transaction ID</td><td><%=bean.getTransactionId() %></td></tr>
<tr><td>Policy ID</td><td><%=bean.getPolicyId() %></td></tr>
<tr><td>Customer Name</td><td><%=bean.getName() %></td></tr>
<tr><td>Amount Received</td><td><%=bean.getEnteredAmount() %></td></tr>
<tr><td>Payment Received for</td><td><%=bean.getDueDate()%>  to  <%=bean.getNextDue() %></td></tr>
<tr><td></td><td><a href="Home.jsp"> <input type="button" value="Go Home"></a></td></tr>
</table>
</form>
</body>
<%--}
catch(NullPointerException e)
{
	response.sendRedirect("Home.jsp");
}
--%>

</html>