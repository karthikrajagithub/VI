<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="Scripts/Valid.js"></script>

</head>


<body>
<%@include file="Header.jsp" %>
<br><br><br>

<%

PaymentBean bean = (PaymentBean)session.getAttribute("bean");
if(bean != null)
{
//	PaymentBean bean = (PaymentBean)session.getAttribute("bean");
	%>
		<form name="directform" onsubmit="return form_validation()" >
<table align="center">
<tr><td>Policy ID</td><td><%=bean.getPolicyId() %></td> </tr>
<tr><td>Due Date</td><td><%=bean.getDueDate() %></td> </tr>
<%
Date date1 = new Date(bean.getDueDate().getTime());
Date date2 = new Date();
long daydif = (date1.getTime()-date2.getTime())/(1000*60*60*24);

if(daydif<31)
        	{%>
        	
<tr><td>Customer Name</td><td><%=bean.getName() %></td> </tr>
<tr><td>Amount</td><td><%=bean.getOldBalance() %></td> </tr>
<tr><td>Mobile Number</td><td><%=bean.getMobileNumber() %></td> </tr>
<tr><td>Payment Mode</td><td><select name="paymode" required>
							<option value="netbank">Netbanking</option>
							<option value="creditcard">Credit Card</option>
							<option value="debitcard">Debit Card</option>
						</select></td> </tr>
												


        		<tr><td></td><td><table><tr><td><input type="submit" onClick="return payconfirm()" value="Proceed" name="sub"></td>
        		<td><input type="reset"></td></tr>
				</table>
        	<%
        	}
        	else
        	{%>
        		</table><table align="center">
        		<tr></tr><tr></tr>
        		<tr><td align="center"> Cannot renew insurance before 30 days of premium expire</td></tr>
        		<tr><td align="center"><a href="Home.jsp"> <input type="button" value="Home"></a></td></tr></table>       		
        	<%
        	}%>
<%
if(request.getParameter("paymode")!=null)
{
	try{
			if(request.getParameter("paymode").equalsIgnoreCase("netbank"))
			{
				bean.setPayMode("Net Banking");
				RequestDispatcher rd=request.getRequestDispatcher("netbanking.jsp");
				session.setAttribute("bean",bean);
				rd.forward(request, response);
			}
		
			else if(request.getParameter("paymode").equalsIgnoreCase("creditcard"))
			{
				bean.setPayMode("Credit Card");
				RequestDispatcher rd = request.getRequestDispatcher("creditcard.jsp");
				session.setAttribute("bean",bean);
	    	    rd.forward(request, response);	
	   		}
			else if(request.getParameter("paymode").equalsIgnoreCase("debitcard"))
			{
				bean.setPayMode("Debit Card");			
				RequestDispatcher rd = request.getRequestDispatcher("debitcard.jsp");
				session.setAttribute("bean",bean);
				rd.forward(request, response);
			}
		}
		catch (NumberFormatException e)
		{
			//throw new PayException("fjgdafjkhdklvhsd!!");
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			request.setAttribute("errMsg", "cjdsagfcksadgk");
			rd.forward(request, response);
		}
	}
}
%>



</form>





</body>
</html>