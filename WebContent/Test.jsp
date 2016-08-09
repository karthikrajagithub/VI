
<%@page import="com.vis.vo.PaymentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>


<body onload="javascript:window.history.forward(1);">
<%@include file="Header.jsp" %>
<br><br>
<form>
<%! PaymentBean bean;%>
<% bean=(PaymentBean)session.getAttribute("bean");%>

<table align="center">
<tr><td>Transaction Id</td><td><%=bean.getTransactionId() %></td></tr>
<tr><td>Policy Id</td><td><%=bean.getPolicyId() %></td></tr>
<tr><td>Customer Name</td><td><%=bean.getName() %></td></tr>
<tr><td>Amount Received</td><td><%=bean.getOldBalance() %></td></tr>
<tr><td>Payment Received for</td><td><%=bean.getDueDate()%>:<%=bean.getNextDue() %></td></tr>
<%session.invalidate(); %>
<tr><td></td><td><a href="Home.jsp"> <input type="button" value="Go Home"></a></td></tr>
</table>
</form>
</body>
</html>