<%@page import="com.vis.vo.PaymentBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body background="Images/gate.jpg" onload="javascript:window.history.forward(1);">

<br><br><br><br><br><br><br><br><br><br><br>
<center><h3>Enter Debit Card Details</h3></center>
<%

PaymentBean bean=(PaymentBean)session.getAttribute("bean"); %>

<form action="DirectPaymentController" method="post">
<table align="center">

<tr><td>CARD NUMBER</td><td><input type="text" name="dcnumber" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="16" autocomplete="off" pattern=".{16,16}"   required title="Enter 16 digit number"></td> </tr>
<tr><td>EXPIRY DATE</td><td><table><tr><td><input type="text" name="month" onkeypress='return event.charCode >= 48 && event.charCode <= 57' autocomplete="off" maxlength="2" pattern=".{2,2}" required title="Enter month in digits"></td>
										<td><input type="text" name="year" onkeypress='return event.charCode >= 48 && event.charCode <= 57' autocomplete="off" maxlength="4" pattern=".{4,4}"   required title="Enter Year in 4 digit formate"></td>
									</tr>
							</table></td></tr>
<tr><td>NAME ON CARD</td><td><input type="text" name="contact" required></td> </tr>
<tr><td>CVV</td><td><input type="password" name="cvv" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="3" pattern=".{3,3}"   required title="Enter 3 digit cvv number"></td> </tr>
<tr><td></td><td><table><tr><td><input type="submit" VALUE="PAY" name="sub"></td><td><input type="reset" VALUE="RESET"></td></tr></table></td></tr>
</table>

</form>


</body>
</html>