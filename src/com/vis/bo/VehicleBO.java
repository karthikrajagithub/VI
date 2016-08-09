package com.vis.bo;


import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import com.vis.dao.VehicleDAO;
import com.vis.exception.BusinessException;
import com.vis.exception.GeneralException;
import com.vis.vo.VehicleBean;

public class VehicleBO 
{
	Calendar can = Calendar.getInstance();
	private String vehicleRegistrationRequestID() throws GeneralException, BusinessException, SQLException,Exception
	{
		String oldId = new VehicleDAO().requestReqId();
		SimpleDateFormat sdf = new SimpleDateFormat("yy");		
		int lastDigits=1;
		String newId=null;
		String subOldId=null;
		String output = null;
		String str="R"+sdf.format(new Date());
		String pattern="0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
//	System.out.println(oldId+" d hdf");
		if(oldId!=null)
		{
			subOldId=oldId.substring(0,3);
			if(str.equalsIgnoreCase(subOldId))
			{
				int num=Integer.parseInt(oldId.substring(3));
				if(num==9999)
				{
					throw new BusinessException("Registrations Closed for this Year");
				}
				while(lastDigits<=num && num<=9999)
				{
					lastDigits++;
				}
				output = myFormatter.format(lastDigits);
				newId=str.toUpperCase()+output;
			}
			else
			{
				output = myFormatter.format(lastDigits);
				newId=str.toUpperCase()+output;
			}
		}
		else
		{
			output = myFormatter.format(lastDigits);
			newId = str.toUpperCase()+output;
		}
//System.out.println(newId+"gfdhfdgh");
		return newId;
	}
	public  boolean user(final VehicleBean bean1) throws GeneralException, BusinessException, SQLException,Exception
	{
		boolean resu = false;
		VehicleBean bean = bean1;
		
		if(bean.getManufacturer().equals("") || bean.getManufacturer().equals("Select Manufacture") || bean.getVehicleModel().equals("") || bean.getVehicleType().equals("") || bean.getVehicleRegistrationState().equals("") || bean.getRegisteringLocation().equals(""))
		{
			throw new BusinessException("Fields Cannot be empty!!");
		}

		int dateop = Integer.parseInt(bean.getDateofPurchase().substring(0, 4));
		
		if(bean.getYearMake()>dateop)
		{
			throw new BusinessException("Year of make should not cross year of purchase");
		}
			
		String vRRID = vehicleRegistrationRequestID();
		bean.setRequestNO(vRRID);
		float premium = premiumAmount(bean);
		bean.setPremiumAmount(premium);
		bean.setVehicleRegReqTime(new Timestamp(new Date().getTime()));
		
		
		resu = new VehicleDAO().vehicleRegUser(bean);
		
		return resu;
		
	}
	private  float premiumAmount(final VehicleBean bean) throws BusinessException
	{
		Date date = null;
		float stax = 0.0f;
		if(bean.getUsage().equals("Public"))
		{
			stax = (float) ((bean.getPrice()*3.4)/100);
		}
		float premiumAmount = (float) ((bean.getPrice()*6.5/100)+stax);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
				date = sdf.parse(bean.getDateofPurchase().toString());
			} 
		catch (ParseException e) {
				throw new BusinessException("Invalid Date of purchase");
			}
		long dayDiff = (new Date().getTime()- date.getTime())/(1000*60*60*24);
		int year = new Date().getYear()-date.getYear(); 
//		System.out.println("day = "+dayDiff);

//		System.out.println("year = "+year);

//		System.out.println("premium original = "+premiumAmount);
		if(year>=5)
		{
			premiumAmount = premiumAmount/2;
		}
		if(dayDiff<=30)
		{
			premiumAmount = (float) (premiumAmount-(premiumAmount*0.03));
		}
		return premiumAmount;
		
	}
	
	
	public List<VehicleBean> requestFetch() throws SQLException, GeneralException,Exception
	{
		List<VehicleBean> list = new VehicleDAO().vehicleRegAdmin();
		return list;
		
	}
	public boolean adminApproval(final VehicleBean bean1) throws GeneralException, BusinessException, SQLException,Exception
	{	
		boolean res = false;
		String type = bean1.getVehicleType();
		String policyId = policyIdGen(type); 
		VehicleBean bean = bean1;
		bean.setPolicyId(policyId);	
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 10); // add 10 days
		Date date = cal.getTime();
		bean.setDueDate(new java.sql.Date(date.getTime()));
		
		bean.setStatus("ACTIVE");
		bean.setVehicleRegReqTime(new Timestamp(new Date().getTime()));
		
		res = new VehicleDAO().vehicleRegUpdate(bean);
		return res;
	}
	public boolean adminRejection(final VehicleBean bean) throws SQLException, GeneralException,Exception
	{
		boolean res = false;
		final String reqId = bean.getRequestNO();
		res = new VehicleDAO().vehicleReject(reqId);
		return res;
	}
	
	
	private String policyIdGen(final String type) throws GeneralException, BusinessException, SQLException, Exception,Exception
	{
	//String type = bean1.getVehicleType();
		String oldId = new VehicleDAO().requestPolicyId(type);
		SimpleDateFormat sdf = new SimpleDateFormat("MM");		
		int lastDigits=1;
		String newId=null;
		String subOldId=null;
		String output = null;
		String str = null;
		if(type.equalsIgnoreCase("twowheeler"))
		{
			str = "TW"+sdf.format(new Date());
		}
		else
		{
			str = "FW"+sdf.format(new Date());
		}
		String pattern="0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
	
		if(oldId!=null)
		{
			subOldId=oldId.substring(0,4);
			if(str.equalsIgnoreCase(subOldId))
			{
				int num=Integer.parseInt(oldId.substring(4));
				while(lastDigits<=num && num<9999)
				{
					lastDigits++;
				}
				output = myFormatter.format(lastDigits);
				newId=str.toUpperCase()+output;
			}
			else
			{
				output = myFormatter.format(lastDigits);
				newId=str.toUpperCase()+output;
			}
		}
		else
		{
			output = myFormatter.format(lastDigits);
			newId = str.toUpperCase()+output;
			//Use String Buffers
		}

		return newId;
	}
	
	
	
}
