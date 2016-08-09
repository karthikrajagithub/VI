
<%@page import="com.vis.vo.ClaimBean"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="Scripts/Valid.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="CSSs/jquery-ui.css" rel="stylesheet">
<script src="Scripts/jquery-1.10.2.js"></script>
<script src="Scripts/jquery-ui.js"></script>
<script type="text/javascript" src="Scripts/Date.js"></script> 
<script type="text/javascript" src="Scripts/Claim.js"></script>  
</head>
 

<body>
<%@include file="Header.jsp" %>
<br><br>
<form action="TheftController" name="axe" onsubmit="validateTheft()" method="post" >
<table align="center">
<% ClaimBean bean=(ClaimBean)session.getAttribute("theft") ;%>       
<tr><td>Policy ID</td><td> <%=bean.getPolicyId() %></td></tr> 
<tr><td>Registration Number</td><td> <%=bean.getVehicleRegNumber()%></td></tr>
<tr><td>Insured Amount</td><td> <%=bean.getPrice() %></td></tr>                                                                                                                                                                                                                                                                                                                                  
<tr><td>OwnerName</td><td> <%=bean.getOwnerName() %></td></tr>
<tr><td>Premium Amount</td><td><%=bean.getPremiumAmount()%></td></tr>
<tr><td>Date Of Theft</td><td><input type="text" id="ramkie"  name="dateoftheft" required ></td></tr>
<tr><td>Date Of Complaint</td><td><input type="text" id="anudeep"  name="dateofcomplaint" required ></td></tr>
<tr><td>FIR Number</td><td><input type="text" maxlength="10" autocomplete="off"  name="Firno" required></td></tr>
<tr><td>Police Station Branch</td><td><input type="text" name="policestationbranch" required></td></tr>
<tr><td></td><td> <input type="submit" onClick="return payconfirm()" ></td><td> <input type="reset"></td></tr>
  </table>
 </form> <center>
 <%if(request.getAttribute("errMsg")!=null)
	 {%>
<h4><%= request.getAttribute("errMsg") %> </h4>
 <%
 }%>
 </center>
</body>
</html>