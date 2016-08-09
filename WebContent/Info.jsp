<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>



<body>
<%@ include file="Header.jsp" %>
<br><br>
<%if(request.getAttribute("vehicleid")!=null)
	 {%><center><h3>
	 Your Policy request has been Accepted<br>
	 and your Insurance Acknowledgment number is " 
	 <%=request.getAttribute("vehicleid") %> "<br><br>
	 <a href="VehicleRegistration.jsp"> <input type="button" value="Register another vehicle"></a>   
	 <a href="Home.jsp"> <input type="button" value="Home"></a>
	 </h3>
	 </center>
	<% }
	 %>
	 
	 
	 <%if(request.getAttribute("custid")!=null)
	 {%><center><h3>
	 
	 Congratulations, your account has been created successfully and your! <br>
	Username/Login Id is "<%=session.getAttribute("custid")%>" and password is same as you entered during registration
	<br> Kindly use the same login id and password  while you login next time
	<br><br>
	 <a href="VehicleRegistration.jsp"> <input type="button" value="Register vehicle"></a>   
	 <a href="Home.jsp"> <input type="button" value="Home"></a>
	 </h3>
	 </center>
	<% }
	 %>
	 
<%if(request.getAttribute("cancelid")!=null)
	 {%><center><h3>
	 
	Your Cancel request is being processed.
	<br>
	You will get you refund amount in 7 working days.
	<br>
	Acknowledgment number is "<%=request.getAttribute("cancelid")%>".
	<br>   
	 <a href="Home.jsp"> <input type="button" value="Home"></a>
	 </h3>
	 </center>
	<% }
	 %>

</body>
</html>