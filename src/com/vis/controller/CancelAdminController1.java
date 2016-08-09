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
import com.vis.exception.BusinessException;
import com.vis.vo.CancelBean;

/**
 * Servlet implementation class CancelAdminController1
 */
public class CancelAdminController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelAdminController1() {
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
			
		try
		{
			HttpSession session = request.getSession(false);
			CancelBean cancelbean = (CancelBean)session.getAttribute(ConstantStrings.CANCLE_BEAN_ADMIN_ATTRIBUTE);
			cancelbean = new CancelBO().payDetails(cancelbean);
			
			session.setAttribute(ConstantStrings.CANCEL_BEAN_ATTRIBUTE , cancelbean);
			
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP );
			request.setAttribute(ConstantStrings.CANCEL_AMOUNT_REQUEST,cancelbean);
			rd.forward(request, response);	
			
		}
		catch (SQLException e) {
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP );
			request.setAttribute(ConstantStrings.ERROR_MSG ,e.getMessage());
			rd.forward(request, response);	
		}
		catch (NumberFormatException e) {
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP );
			request.setAttribute(ConstantStrings.ERROR_MSG,"Check the Fields");
			rd.forward(request, response);	
		}
		catch (BusinessException e) {
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP);
			request.setAttribute(ConstantStrings.ERROR_MSG,e.getMessage());
			rd.forward(request, response);	
		}
		catch (Exception e) {
			RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP);
			request.setAttribute(ConstantStrings.ERROR_MSG,"Check the Fields");
			rd.forward(request, response);	
		}
	
	
	}

}
