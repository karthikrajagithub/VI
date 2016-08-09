<%@page import="com.vis.vo.CancelBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="com.vis.vo.PaymentBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>


<body>
<%@include file="Header.jsp" %>
<br><br>
<%if(request.getParameter("val")!=null)
	{
    List<PaymentBean> list;
    String policyid;
    %>
    <% policyid=request.getParameter("val").toString();  
       list=(List<PaymentBean>)session.getAttribute("list");
       for(PaymentBean obje:list)
        	{
        		if(policyid.equalsIgnoreCase(obje.getPolicyId()))
        		{
        			session.setAttribute("bean",obje);
				}
        	} 
        response.sendRedirect("PayController");
	}
	%>
	
	
	
   <%if(request.getParameter("canclepid")!=null)
	{
    List<CancelBean> list;
    String policyid;
    %>
    <% policyid=request.getParameter("canclepid").toString();  
       list=(List<CancelBean>)session.getAttribute("cancellist");
       for(CancelBean obje:list)
        	{
        		if(policyid.equalsIgnoreCase(obje.getPolicyId()))
        		{
        			session.setAttribute("canclebean",obje);
        		}
        	}
        response.sendRedirect("CancelUserController1");
	}
	%>    

</body>
</html>