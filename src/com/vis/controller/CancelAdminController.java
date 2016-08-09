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
 * Servlet implementation class CancelAdminController
 */
public class CancelAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelAdminController() {
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
	
			CancelBean bean = new CancelBean();
			try
			{
				HttpSession session = request.getSession(false);
				bean.setPolicyId(request.getParameter(ConstantStrings.POLICY_ID).toString());
				bean = new CancelBO().cancelAdmin1(bean);
				
				session.setAttribute(ConstantStrings.CANCEL_BEAN_ADMIN_ATTRIBUTE, bean);
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_CANCLE_JSP );
				request.setAttribute(ConstantStrings.ADMIN_CANCEL_REQUEST ,bean.getPolicyId());
				rd.forward(request, response);	
				
			}
			catch (SQLException e) {
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP);
				request.setAttribute(ConstantStrings.ERROR_MSG ,e.getMessage());
				rd.forward(request, response);	
			}
			catch (NumberFormatException e) {
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP);
				request.setAttribute(ConstantStrings.ERROR_MSG ,"Check the Fields");
				rd.forward(request, response);	
			}
			catch (Exception e) {
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ADMIN_JSP);
				request.setAttribute(ConstantStrings.ERROR_MSG ,"No policy exits with "+bean.getPolicyId());
				rd.forward(request, response);	
			}
	
	}

}
