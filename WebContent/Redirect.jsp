<%@page import="com.vis.vo.ClaimBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.vis.vo.VehicleBean"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<%if(session.getAttribute("vehiclelist")!=null)
			{
				String policyRid = request.getParameter("reqno").toString();
				String str = request.getParameter("val").toString();
				List<VehicleBean> list = (List<VehicleBean>)session.getAttribute("vehiclelist");
				for(VehicleBean obj:list)
				{
					if(policyRid.equalsIgnoreCase(obj.getRequestNO()))
        			{
        				session.setAttribute("vehicleupdatebean",obj);
					}
				}
				
				RequestDispatcher reqd = request.getRequestDispatcher("VehicleRegUpdate");
				request.setAttribute("decision",str);
				reqd.forward(request,response);
			}%>


<%if(request.getParameter("canclepid")!=null)
	{
        response.sendRedirect("CancelAdminController1");
	}
	%>    



</body>
</html>