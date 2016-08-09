<%@page import="com.vis.vo.PaymentBean"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.vis.exception.GeneralException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="Scripts/Valid.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>



<body>
<%@include file="Header.jsp" %>
<br><br><br>
<%-- onsubmit="return form_validation()" --%>
<form name="directform" onsubmit="return form_validation()" >
<table align="center">
<tr><td>Policy ID</td><td><input type="text"  name="policyid" maxlength="8" required ><span style="color:red;" id="error" > </span></td> </tr>
<tr><td>Amount</td><td><input type="text"  name="policyamount" required ><span style="color:red;" id="error1" > </span></td> </tr>
<tr><td>Mobile Number</td><td><input type="text" name="contact" maxlength="10" required><span style="color:red;" id="error2" > </span></td> </tr>
<tr><td>Payment Mode</td><td><select name="paymode" required>
							<option value="netbank">Netbanking</option>
							<option value="creditcard">Credit Card</option>
							<option value="debitcard">Debit Card</option>
						</select></td> </tr>
<tr><td></td><td><table><tr><td><input type="submit" value="Proceed" name="sub"></td><td><input type="reset"></td></tr></table></td></tr>
</table>

</form>
<%
PaymentBean bean=new PaymentBean();



if(request.getParameter("sub")!=null)
{
	
	try{
		bean.setPolicyId(request.getParameter("policyid").toString());
		bean.setEnteredAmount(Float.parseFloat(request.getParameter("policyamount").toString()));
		bean.setMobileNumber(Long.parseLong(request.getParameter("contact").toString()));
		bean.setPayMode(request.getParameter("paymode").toString());
		if(request.getParameter("paymode").equalsIgnoreCase("netbank"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("netbanking.jsp");
			session.setAttribute("bean",bean);
			rd.forward(request, response);
//			String s="netbanking.jsp";
//		    response.sendRedirect(s);
		}
		
		else if(request.getParameter("paymode").equalsIgnoreCase("creditcard"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("creditcard.jsp");
			session.setAttribute("bean",bean);
	        rd.forward(request, response);	
	    }
		else if(request.getParameter("paymode").equalsIgnoreCase("debitcard"))
		{
			
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
//		bean.setPolicyId(request.getParameter("policyid").toString());
//		bean.setEnteredAmount(Float.parseFloat(request.getParameter("policyamount").toString()));
//		bean.setMobileNumber(Long.parseLong(request.getParameter("contact").toString()));
//		bean.setPayMode(request.getParameter("paymode").toString());

	
}
%>
</body>
</html>