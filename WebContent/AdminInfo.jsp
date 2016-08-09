<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>



<body>
<%@include file="AdminHeader.jsp" %>
	<br><br><br>
	
<%if(request.getAttribute("cancelid")!=null)
	 {%><center><h3>
	 
	Your Cancel request is being processed.
	<br>
	You will get you refund amount in 7 working days.
	<br>
	Acknowledgment number is "<%=request.getAttribute("cancelid")%>".
	<br>   
	 <a href="AdminHome.jsp"> <input type="button" value="Home"></a>
	 </h3>
	 </center>
	<% }
	 %>


</body>
</html>