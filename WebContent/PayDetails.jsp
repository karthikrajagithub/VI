<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type='text/javascript' src="Scripts/Valid.js"></script>
</head>



<body>
<%@include file="Header.jsp" %>
<br><br>
<%PaymentBean bean = (PaymentBean)session.getAttribute("bean"); %>
<form>

	<table  align="center">
		<tr>
			<td>Policy ID</td>
			<td><%= bean.getPolicyId() %></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><%= bean.getName() %></td>
		</tr>
		<tr>
			<td>Due Date</td>
			<td><%= bean.getDueDate() %></td>
		</tr>
		<tr>	
			<td>Due Amount</td>
			<td><%= bean.getAmount() %></td>
		</tr>
		<tr>	
			<td>Balance to pay</td>
			<td><%= bean.getOldBalance() %></td>
		</tr>
		<tr>	
			<td>Late Fee</td>
			<td><%= bean.getLateFee() %>    <span style="color:#999999;  font-style: italic; font-size: 9pt">(0.56% of premium per day after due date)</span></td>
		</tr>
		<tr>
			<td>Payment Mode</td>
			<td>
				<select name="paymode" required>
							<option value="netbank">Netbanking</option>
							<option value="creditcard">Credit Card</option>
							<option value="debitcard">Debit Card</option>
				</select></td>
		</tr>
		<tr>	
			<td></td>
			<td><input type="submit" onClick="return payconfirm()" value="Pay Premium" name="sub"></td>
		</tr>
	</table>

</form>
<% 
if(request.getParameter("sub")!=null)
{
		if(request.getParameter("paymode").equalsIgnoreCase("netbank"))
		{
			bean.setPayMode(request.getParameter("paymode").toString());
			RequestDispatcher rd=request.getRequestDispatcher("netbanking.jsp");
			session.setAttribute("bean",bean);
			rd.forward(request, response);
//			String s="netbanking.jsp";
//		    response.sendRedirect(s);
		}
		
		else if(request.getParameter("paymode").equalsIgnoreCase("creditcard"))
		{
			bean.setPayMode(request.getParameter("paymode").toString());
			RequestDispatcher rd = request.getRequestDispatcher("creditcard.jsp");
			session.setAttribute("bean",bean);
	        rd.forward(request, response);	
	    }
		else if(request.getParameter("paymode").equalsIgnoreCase("debitcard"))
		{
			bean.setPayMode(request.getParameter("paymode").toString());
			RequestDispatcher rd = request.getRequestDispatcher("debitcard.jsp");
			session.setAttribute("bean",bean);
			rd.forward(request, response);
		}


	
}%>

</body>
</html>