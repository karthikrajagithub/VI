<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="com.vis.vo.ClaimBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%if(request.getParameter("accno")!=null)
	{
	String policyid = request.getParameter("accno").toString();
	String str = request.getParameter("val").toString();
	List<ClaimBean> list = (List<ClaimBean>)session.getAttribute("acclist");
	for(ClaimBean obj:list)
	{
		if(policyid.equalsIgnoreCase(obj.getPolicyId()))
		{
			session.setAttribute("claimupdate",obj);
		}
	}
	
	RequestDispatcher reqd = request.getRequestDispatcher("ClaimUpdate");
	request.setAttribute("decision",str);
	reqd.forward(request,response);
}
else
{
	String policyid = request.getParameter("tefno").toString();
	String str = request.getParameter("val").toString();
	List<ClaimBean> list = (List<ClaimBean>)session.getAttribute("theftlist");
	for(ClaimBean obj:list)
	{
		if(policyid.equalsIgnoreCase(obj.getPolicyId()))
		{
			obj.setClaimType("THEFT");
			session.setAttribute("claimupdate",obj);
		}
	}
	
	RequestDispatcher reqd = request.getRequestDispatcher("ClaimUpdate");
	request.setAttribute("decision",str);
	reqd.forward(request,response);
}
	%>    


</body>
</html>