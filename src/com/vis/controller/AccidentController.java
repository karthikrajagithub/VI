package com.vis.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.vis.bo.ClaimBO;
import com.vis.bo.ConstantStrings;
import com.vis.exception.BusinessException;
import com.vis.exception.GeneralException;
import com.vis.vo.ClaimBean;

/**
 * Servlet implementation class AccidentController
 */
public class AccidentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccidentController() {
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
		HttpSession obj=request.getSession(); 
		ClaimBean bean=(ClaimBean)obj.getAttribute(ConstantStrings.ACCIDENT_ATTRIBUTE);
		boolean res=false;
		try {
				bean.setCustId(Integer.parseInt(obj.getAttribute(ConstantStrings.CUSTOMER_ID).toString()));
		        bean.setPremiumAmount(bean.getPremiumAmount());
				bean.setType(request.getParameter(ConstantStrings.TYPE));
				bean.setDateOfAccident(request.getParameter(ConstantStrings.DATE_OF_ACCIDENT));
				res= new ClaimBO().insertaccidentDetails(bean);
				if(res)
				{
			
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.POLICY_STATUS );
	              obj.setAttribute(ConstantStrings.DETAILS_ATTRIBUTE , bean);
	              request.setAttribute(ConstantStrings.ACCIDENT_ID , bean.getAcknowledgeId());
	              rd.forward(request, response);
				}
				else
				{
					throw new BusinessException("Unable to process request.. Please try after some time..");
				}
			}
			catch (BusinessException e) {
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR );
				request.setAttribute(ConstantStrings.ERROR_MSG ,e.getMessage());
				rd.forward(request, response);
			} 
			catch (GeneralException e) {
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR );
				request.setAttribute(ConstantStrings.ERROR_MSG ,e.getMessage());
				rd.forward(request, response);
			}
			catch (SQLException e) {
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR );
				request.setAttribute(ConstantStrings.ERROR_MSG ,e.getMessage());
				rd.forward(request, response);
			} 
			catch (Exception e) {
				RequestDispatcher rd=request.getRequestDispatcher(ConstantStrings.ERROR );
				request.setAttribute(ConstantStrings.ERROR_MSG ,e.getMessage());
				rd.forward(request, response);
			} 
		
}
}
