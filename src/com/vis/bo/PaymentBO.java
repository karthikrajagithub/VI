package com.vis.bo;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
//import org.apache.log4j.Logger;
import com.vis.dao.PaymentDAO;
import com.vis.exception.BusinessException;
import com.vis.exception.GeneralException;
import com.vis.vo.PaymentBean;

public class PaymentBO
{
	final static transient float INTEREST_RATE = 0.56f; 
	float newBalance=0.0f;
	Calendar calen = Calendar.getInstance(); 
//	public static final Logger LOG = Logger.getLogger(PaymentBO.class);
	
	private PaymentBean payIdGenerator(PaymentBean bean1) throws GeneralException, BusinessException, SQLException,Exception
	{
//		LOG.info("Entered Transaction ID generator");
		PaymentBean bean = bean1; 
		int lastDigits=1;
		String newId=null;
		String subOldId=null;
		String output = null;
		final SimpleDateFormat sdf=new SimpleDateFormat("MMM");
		final String str=sdf.format(new Date());
		final String pattern="0000";
		final DecimalFormat myFormatter = new DecimalFormat(pattern);
	    final String oldId=new PaymentDAO().recentPayId();
//	    System.out.println("oldId = "+oldId);
		if(oldId==null)
		{
			output = myFormatter.format(lastDigits);
			newId = str.toUpperCase()+output;
			bean.setTransactionId(newId);
		}
		else
		{
			subOldId=oldId.substring(0,3);
			if(str.equalsIgnoreCase(subOldId))
			{
				final int num=Integer.parseInt(oldId.substring(3));
				if(num==9999)
				{
					throw new BusinessException("Payments Closed for this month");
				}
				while(lastDigits<=num && num<=9999)
				{
					lastDigits++;
				}
				output = myFormatter.format(lastDigits);
				newId=str.toUpperCase()+output;
				bean.setTransactionId(newId);
			}
			else
			{
				output = myFormatter.format(lastDigits);
				newId=str.toUpperCase()+output;
				bean.setTransactionId(newId);
			}				
		}
//		System.out.println("id="+idGen);
		return bean;
	}
	
	public boolean payPremiun(final PaymentBean bean1) throws GeneralException, BusinessException, SQLException,Exception
	{
		boolean check=false;
//		PaymentBean bean = bean1;
//		LOG.info("Going to calculate Premium amount");
		final PaymentBean bean = calPremium(bean1);
//		LOG.info("Calculated Premium amount : "+calPre);
//		LOG.info("Going to generate Transaction id");
		PaymentBean bean2 = payIdGenerator(bean);
//		LOG.info("Transaction id generated : "+idGen);
			bean2.setPayTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			check=new PaymentDAO().payRegister(bean2);
		return check;
	}
	
	public PaymentBean calPremium(final PaymentBean bean1) throws GeneralException, BusinessException, SQLException,Exception
	{
//		boolean calPre=false;
		PaymentBean bean = new PaymentDAO().getPremiumDetail(bean1);
		calen.setTime(bean.getDueDate()); 
		final boolean dateCompare=Calendar.getInstance().before(calen);
		final boolean dateCompareEqual = Calendar.getInstance().equals(calen);
		if(dateCompare || dateCompareEqual)
		{
			newBalance=bean.getOldBalance();
			calen.setTime(bean.getDueDate());
			calen.add(Calendar.YEAR, 1);
	//		newBalance=bean.getAmount()+newBalance;
			bean.setNextDue(new java.sql.Date(calen.getTimeInMillis()));
			bean1.setNewBalance(bean.getAmount());
//			calPre=true;
		}
		
		else
		{
			throw new BusinessException("Due date over please login and pay your due amount");
		}
		return bean;
	}
	
	
	public boolean payRegPremium(final PaymentBean bean1) throws GeneralException, BusinessException, SQLException,Exception
	{
		boolean check=false;

//		LOG.info("Going to generate Transaction id");
		PaymentBean bean = payIdGenerator(bean1);
//		LOG.info("Transaction id generated : "+idGen);
		bean.setPayTime(new java.sql.Timestamp(new java.util.Date().getTime()));
		check=new PaymentDAO().payRegister(bean);
		return check;
		
	}
	
	public PaymentBean calRegPremium(final PaymentBean bean1) throws GeneralException, BusinessException, SQLException
	{
		PaymentBean bean = bean1;
		bean.setEnteredAmount(bean.getOldBalance()+bean.getLateFee());
		calen.add(Calendar.YEAR, 1);
		bean.setNextDue(new java.sql.Date(calen.getTimeInMillis()));
		bean.setNewBalance(bean.getAmount());
		bean.setNextDue(new java.sql.Date(calen.getTimeInMillis()));
		return bean;
	}
	
	public PaymentBean lateFeeCal(final PaymentBean bean1) throws GeneralException, BusinessException, SQLException
	{
//		boolean calReg = false;
		long dateDiff = 0;
		float lateFee = 0;
		int lateByDays = 0;
		PaymentBean bean = bean1;
//		System.out.println("late fee Due date = "+bean.getDueDate());
		calen.setTime(bean.getDueDate()); 
		final boolean dateCompare=Calendar.getInstance().before(calen);
		final boolean dateCompareEqual = Calendar.getInstance().equals(calen);
		if(dateCompare || dateCompareEqual)
		{
			lateByDays = 0;
		}
		else
		{
			dateDiff = new Date().getTime() - bean.getDueDate().getTime();
			lateByDays =(int)dateDiff/(1000*60*60*24);
		}
		lateFee = bean.getAmount()*INTEREST_RATE*lateByDays/100;
		bean.setLateByDays(lateByDays);
		bean.setLateFee(lateFee);
		PaymentBean bean2 = calRegPremium(bean);
		bean.setCheck(1);
//		if(!calReg)
//		{
//			throw new PayBusinessException("calRegPremium error....");
//		}	
		return bean2;	
	}	
	
	
	public List<PaymentBean> getDetails(final PaymentBean bean) throws BusinessException, GeneralException, SQLException,Exception
	{
		List<PaymentBean> userPolicyList=new ArrayList<PaymentBean>();
		userPolicyList=new PaymentDAO().policyDetails(bean);
		return userPolicyList;	
	}
	
	public PaymentBean getPolicyDetails(final PaymentBean bean) throws GeneralException, BusinessException, SQLException,Exception
	{	
		PaymentBean bean1 = new PaymentDAO().getPremiumDetail(bean);
		return bean1;
	}
}
