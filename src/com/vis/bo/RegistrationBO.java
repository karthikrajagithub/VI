package com.vis.bo;
 


import com.vis.dao.ConstantDAO;
import com.vis.dao.RegistrationDAO;
import com.vis.exception.BusinessException;
import com.vis.exception.GeneralException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;

import com.vis.vo.RegistrationBean;

/**
 * @author 512645
 *
 */
public class RegistrationBO {
	/**
	 * 
	 */
	public static final Logger LOG =Logger.getLogger(RegistrationBO.class);
	
	/**
	 * @param bean
	 * @return
	 * @throws RegistrationBusinessException
	 * @throws RegistrationException
	 * @throws SQLException
	 */
	private int customerId(RegistrationBean bean) throws GeneralException, BusinessException, SQLException, Exception
	{
		// customer ID generation method
		int aa=0;
        Date cd=new Date();
        SimpleDateFormat sfd=new SimpleDateFormat("yyyyMM");
        String sss=sfd.format(cd);
        String ss=sss+"0001";
        String ss1 = sss+"9999";
        aa=Integer.parseInt(ss);  
        int aaa = Integer.parseInt(ss1);
        
        int bb= new RegistrationDAO().recentCustId();
        if(bb==Integer.parseInt(ss1))
		{
			throw new BusinessException("Registrations Closed for this month");
		}
        if(aa<=bb)
    {
       	int a=1;
   	while(a==1 && aa<(aaa+1))
       	{
      		aa=aa+1;
       		if(aa>bb)
       		{
        			a=0;
      		}
      	}               
        }
//        System.out.println("custid = "+aa);
        return aa;
	}
        
	/**
	 * @param bean
	 * @return
	 * @throws RegistrationBusinessException
	 * @throws RegistrationException
	 * @throws SQLException 
	 * @throws ParseException 
	 */
	public boolean registration(RegistrationBean bean) throws GeneralException, BusinessException, SQLException, Exception
	{
		boolean res=false;
		/* Date validation*/
		Date d=new Date();
		SimpleDateFormat sd= new SimpleDateFormat("yyyy-MM-dd");
//		System.out.println(bean.getSelectedDate());
		try {
			d=sd.parse(bean.getSelectedDate().toString());
			Date d1= new Date();
			long n=d1.getTime()-d.getTime();
			int n1=(int)(n/3.14e10);
			if(n1<18 || n1>80)
				{
					throw new BusinessException("Invalid Age!! Age should be between 18-80 years");
				}
			}
		catch (ParseException e) 
		{
//			System.out.println(e);
			throw new BusinessException("Invalid Age!!");
		}
		
		// NAME FORMAT VALIDATION
		final String fname = bean.getFirstname().toString();
		final String lname = bean.getLastname().toString();
		final String citi = bean.getCity().toString();
		final String province = bean.getState().toString();
		final String country1 = bean.getCountry().toString();
		final boolean c = fname.matches(ConstantDAO.NAME_VALID);
		final boolean e = lname.matches(ConstantDAO.LAST_NAME);
		final boolean f = citi.matches(ConstantDAO.NAME_VALID);
		final boolean g = province.matches(ConstantDAO.STATE_NAME);
		final boolean h = country1.matches(ConstantDAO.STATE_NAME);
		if(c == false || e == false || f == false || g == false || h == false)
		{
			throw new BusinessException("Name, Country, State and City should contain characters only");
		}
		// NUMBER FORMAT VALIDATION
		
		final int pin = bean.getPincode();
		if(pin < 100000 || pin >999999)
		{
			throw new BusinessException("pincode should be a 6 digit number");
		}
		final String mob1 =Long.toString(bean.getPhone()); 
		final boolean i = mob1.matches(ConstantDAO.NUMBER_VALID);
		if(!i)
		{
			throw new BusinessException("Mobile number should be a 10 digit number and should start with 9 or 8 or 7");
		}
		res = redirectToDB(bean);
		return res;
	}

	public boolean redirectToDB(RegistrationBean bean)
			throws BusinessException, GeneralException, SQLException, Exception {
		boolean res;
	
		// TIME STAMP GENERATION
		bean.setTime(new java.sql.Timestamp(new java.util.Date().getTime()));
		int generateId=customerId(bean);
		
		bean.setGenerateId(generateId);
		res=new RegistrationDAO().registerUser(bean);
		return res;
	}

	/**
	 * @param bean
	 * @return 
	 * @throws RegistrationBusinessException
	 * @throws RegistrationException
	 * @throws SQLException 
	 */
	public String validateLogin(RegistrationBean bean) throws GeneralException, BusinessException, SQLException, Exception
	{
		String res=null;
		
		res=new RegistrationDAO().getLoginDetails(bean);
		return res;
	}
}
