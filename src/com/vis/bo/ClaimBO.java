package com.vis.bo;


import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.vis.dao.ClaimDAO;
import com.vis.exception.BusinessException;
import com.vis.exception.GeneralException;

import com.vis.vo.ClaimBean;



public class ClaimBO {
	
	
	//to insert claim id and insured amount in the database
	public boolean insertClaimDetails(ClaimBean bean) throws GeneralException, BusinessException, SQLException,Exception
	{
			bean.setClaimtime(new java.sql.Timestamp(new java.util.Date().getTime()));
			ClaimBean bean1 = calInsuredAmount(bean);
			String idClaim = claimId();
			bean1.setClaimId(idClaim);
			bean1.setClaimtime(new java.sql.Timestamp(new Date().getTime()));
			if(bean.getClaimType().equalsIgnoreCase("THEFT"))
			{
				bean1.setAcknowledgeId(bean1.getTheftAcknowledgeId());
			}
			return new ClaimDAO().adminApproveUpdate(bean1);
	}

	
	public boolean updateReject(ClaimBean bean) throws GeneralException, Exception
	{
		return new ClaimDAO().adminRejectUpdate(bean);
		
	}
	
	
	public List<ClaimBean> customerDetails(ClaimBean bean) throws GeneralException, BusinessException, SQLException,Exception
	{		
		return new ClaimDAO().customerDetails(bean);
	}
	
	public ClaimBean accidentDetails(ClaimBean bean) throws GeneralException, BusinessException, SQLException,Exception
	{
		return new ClaimDAO().accidentDetails(bean);
	}
	
	public List<ClaimBean> claimAcclist() throws GeneralException, BusinessException, SQLException,Exception
	{
		return new ClaimDAO().accPending();
	}
	public List<ClaimBean> claimTheftlist() throws GeneralException, BusinessException, SQLException,Exception
	{
		return new ClaimDAO().theftPending();
	}
	
	//accident acknowledgment id generator in BO
	private int ackId(ClaimBean bean) throws GeneralException, BusinessException, SQLException,Exception
	{
		int ackID=0;
        int recentID= new ClaimDAO().acknowledgeId(bean);
        if(ackID<=recentID)
        {
        	int flag=1;
        	while(flag==1)
        	{
        		ackID=ackID+1;
        		if(ackID>recentID)
        		{
        			flag=0;
        		}
        	}               
        }
        return ackID;
	}
	
	public boolean insertaccidentDetails(ClaimBean bean) throws GeneralException, BusinessException,Exception
	{
			bean.setRequestTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			bean.setClaimType("ACCIDENT");
			ClaimBean bean1 = calInsuredAmount(bean);
			int acknowledgeId = ackId(bean1);
			bean1.setAcknowledgeId(acknowledgeId);
	
			return new ClaimDAO().insertaccidentDetails(bean1);
	}

	//theft acknowledgment id generator in BO
	private int theftAckId(ClaimBean bean) throws GeneralException, BusinessException, SQLException,Exception
	{
		int theftAckID=0;
        int recentAckID= new ClaimDAO().theftAcknowledgeId(bean);
        if(theftAckID<=recentAckID)
        {
        	int flag=1;
        	while(flag==1)
        	{
        		theftAckID=theftAckID+1;
        		if(theftAckID>recentAckID)
        		{
        			flag=0;
        		}
        	}               
        }
        return theftAckID;
	}
	
	//
	public boolean insertTheftDetails(ClaimBean bean) throws GeneralException, BusinessException, Exception, ParseException, SQLException
	{
		
			int days= validateDateDiff(bean);
			if(days >10 || days<0)
			{
				throw new BusinessException("date of complaint should  be with in ten days of the theft date");
			}
			bean.setRequestTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			int theftAcknowledgeId = theftAckId(bean);
			bean.setTheftAcknowledgeId(theftAcknowledgeId);
		
		return new ClaimDAO().insertTheftDetails(bean);
	}
	
	private String claimId() throws GeneralException, BusinessException, SQLException,Exception
	{
		int lastDigits=1;
		String newId=null;
		String subOldId=null;
		String output = null;
		SimpleDateFormat sdf=new SimpleDateFormat("MMMyy");
		String str=sdf.format(new Date());
		String pattern="0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
	    String oldId=new ClaimDAO().claimIdGen();

		if(oldId!=null)
		{
			subOldId=oldId.substring(0,5);
			if(str.equalsIgnoreCase(subOldId))
			{
				int num=Integer.parseInt(oldId.substring(5));
				if(num==9999)
				{
					throw new BusinessException("Cannot Process");
				}
				while(lastDigits<=num)
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
		return newId;
	
	}
	
	//To calculate insured amount of the policy
	private ClaimBean calInsuredAmount(ClaimBean bean) throws GeneralException, BusinessException, SQLException,Exception
	{
		
		float amounttorefund=0.0f;
		int weightage = 0;
		float vehiclePrice=bean.getPrice();
		String vehicleType=bean.getVehicleType();

		
		if(bean.getClaimType().equalsIgnoreCase("ACCIDENT"))
		{
			
			String type = bean.getType().toString();
			if(vehicleType.equalsIgnoreCase("TwoWheeler"))
			{
				if(type.equalsIgnoreCase("Fire"))
				{
					amounttorefund=(float) (vehiclePrice*0.8);
					weightage = 80;
				}
				else if(type.equalsIgnoreCase("Road Accident"))
				{
					amounttorefund=(float) (vehiclePrice*0.7);
					weightage = 70;
				}
				else if(type.equalsIgnoreCase("Malicious Act"))
				{
					amounttorefund=(float) (vehiclePrice*0.5);
					weightage = 50;
				}
				else if(type.equalsIgnoreCase("Self-destruction"))
				{
					amounttorefund=(float) (vehiclePrice*0.4);
					weightage = 40;
				}
				else if(type.equalsIgnoreCase("Part Failure"))
				{
					amounttorefund=(float) (vehiclePrice*0.2);
					weightage = 20;
				}
			}
			else if(vehicleType.equalsIgnoreCase("FourWheeler"))
			{
				if(type.equalsIgnoreCase("Fire"))
				{
					amounttorefund=(float) (vehiclePrice*0.7);
					weightage = 70;
				}
				else if(type.equalsIgnoreCase("Road Accident"))
				{
					amounttorefund=(float) (vehiclePrice*0.65);
					weightage = 65;
				}
				else if(type.equalsIgnoreCase("Malicious Act"))
				{
					amounttorefund=(float) (vehiclePrice*0.5);
					weightage = 50;
				}
				else if(type.equalsIgnoreCase("Self-destruction"))
				{
					amounttorefund=(float) (vehiclePrice*0.3);
					weightage = 30;
				}
				else if(type.equalsIgnoreCase("Part Failure"))
				{
					amounttorefund=(float) (vehiclePrice*0.2);
					weightage = 20;
				}
			}
		}
		else if(bean.getClaimType().equalsIgnoreCase("THEFT"))
		{
			amounttorefund = (float)(vehiclePrice*0.75);
		}
		if(vehicleType.equalsIgnoreCase("TwoWheeler") && amounttorefund<5000)
		{
			throw new BusinessException("Minimum amount to claim is 5000");
		}
		else if(vehicleType.equalsIgnoreCase("fourWheeler") && amounttorefund<20000)
		{
			throw new BusinessException("Minimum amount to claim is 20000");
		}
		
		bean.setWeightage(weightage);
		bean.setClaimRefund(amounttorefund);
		
		
		return bean;
	}
	
	
	//To validate Date of theft and Date of complaint constraints
	private int validateDateDiff(ClaimBean bean)
	{
		int dayDiff=0;
		String dayTheft=bean.getDateOfTheft();
		String dayComplain=bean.getDateofcomplaint();
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd");
		Date dTheft;
		Date dComplain;
		try {
			dTheft = sd.parse(dayTheft);
			dComplain=sd.parse(dayComplain);
			long difference=dComplain.getTime()-dTheft.getTime();
			dayDiff=(int)(difference/8.64e7);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dayDiff;
	}
}
	
	
	

