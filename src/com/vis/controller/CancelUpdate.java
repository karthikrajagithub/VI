package com.vis.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vis.bo.CancelBO;
import com.vis.bo.ConstantStrings;
import com.vis.vo.CancelBean;

/**
 * Servlet implementation class CancelUpdate
 */
public class CancelUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		try
		{
			boolean res = false;
			CancelBean cancelbean = (CancelBean)session.getAttribute(ConstantStrings.CANCEL_BEAN_ATTRIBUTE );
			res = new CancelBO().cancelUser(cancelbean);
			if(res)
			{
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_INFO_JSP);
				request.setAttribute(ConstantStrings.CANCEL_ID_REQUEST ,cancelbean.getCancelAck());
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR);
				request.setAttribute(ConstantStrings.ERROR_MSG ,"Error occured");
				rd.forward(request, response);
				
			}
		}
		catch (SQLException e) {
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR);
			request.setAttribute(ConstantStrings.ERROR_MSG ,e.getMessage());
			rd.forward(request, response);	
		}
		catch (NumberFormatException e) {
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR);
			request.setAttribute(ConstantStrings.ERROR_MSG ,"Check the Fields");
			rd.forward(request, response);	
		}
		catch (Exception e) {
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR);
			request.setAttribute(ConstantStrings.ERROR_MSG ,"Check the Fields");
			rd.forward(request, response);	
		}
		
	}

	
	

}
