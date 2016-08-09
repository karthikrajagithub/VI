
<%@page import="com.vis.vo.ClaimBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="Scripts/Valid.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Accidental Page</title>
<link href="CSSs/jquery-ui.css" rel="stylesheet">
<script src="Scripts/jquery-1.10.2.js"></script>
<script src="Scripts/jquery-ui.js"></script> 
<script type="text/javascript" src="Scripts/Date.js"></script> 
</head>
<br><br>
<body>
    <%@include file="Header.jsp" %>

<center>
<h4><%if(request.getAttribute("errMsg")!=null)
	 {%>
	 <%=request.getAttribute("errMsg") %>
	<% }
	 %></h4></center>
<form action="AccidentController" method="post" onload="javascript:window.history.forward(1);">

<% ClaimBean bean=(ClaimBean)session.getAttribute("accidnt") ;%>   
<table align="center">   
<tr><td>Policy ID </td><td><%=bean.getPolicyId() %></td></tr> 
<tr><td>Registration Number </td><td><%=bean.getVehicleRegNumber() %></td></tr>
<tr><td>Insured Amount</td><td> <%=bean.getPrice() %>                                                                                                                                                                                                                                                                                                                             
<tr><td>OwnerName </td><td><%=bean.getOwnerName() %></td></tr>
<tr><td>Premium amount</td><td><%=bean.getPremiumAmount() %></td></tr>
<tr><td>Accident Type</td><td>
  <select name="type">
  <option value="Fire"> fire</option>
    <option value="Road Accident">roadaccident</option>
      <option value="Malicious Act">maliciousact</option>
       <option value="Self-destruction">selfdestruction</option>
        <option value="Part Failure">partfailure</option>
  </select>
  </td></tr>
  
 <tr><td> Date Of Accident</td><td><input type="text" id="ramkie"  name="Dateofaccident" required ></td></tr>
 
 <tr><td></td><td><input type="submit" onClick="return payconfirm()" value = "Confirm Claim"></td> <td><input type="reset"></td></tr>
  </table>
  
</form>
</body>
</html>