package com.vis.bo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.vis.dao.CancelDAO;
import com.vis.exception.GeneralException;
import com.vis.vo.CancelBean;


public class CancelBO 
{

	public CancelBean cancelAdmin1(CancelBean bean) throws GeneralException, Exception
	{
		return new CancelDAO().adminGetRequests(bean);
		
	}
	// meaningful names
	public List<CancelBean>  cancelUser1(CancelBean bean) throws Exception
	{
		List<CancelBean> userPolicyList=new ArrayList<CancelBean>();
		userPolicyList=new CancelDAO().userDetails(bean);
		return userPolicyList;			
	}
	// accessors
	private float calculateRefund(final CancelBean bean)
	{	
		Date date1 = new Date(bean.getVehicleRegReqTime().getTime());
		Date date2 = new Date();
		long daysdiff = date2.getTime()-date1.getTime();
		daysdiff = daysdiff/(1000*60*60*24);
		float refund = 0.0f;
		if(daysdiff<=60)
			{
				refund = (int)(bean.getTotalPremiumPaid()-(bean.getTotalPremiumPaid()*0.07));
			}
		else if(daysdiff<=120)
			{
				refund = (int)(bean.getTotalPremiumPaid()-(bean.getTotalPremiumPaid()*0.1025));
			}
		else if(daysdiff<=180)
			{
				refund = (int)(bean.getTotalPremiumPaid()-(bean.getTotalPremiumPaid()*0.1235));
			}
		else
			{
				refund = 0.0f;			
			}
		return refund;
	}
	
	public boolean cancelUser(CancelBean bean) throws GeneralException, Exception
	{
		CancelBean cancelbean = bean;
		String cancelId = generateCancellationID();
		bean.setCancelAck(cancelId);
		float refund = calculateRefund(bean);
		bean.setAmountrefunded(refund);
		//Constant file
		bean.setStatus("CANCLED");
		return new CancelDAO().userCancellationRequest(cancelbean);	
	}
	
	private String generateCancellationID() throws GeneralException, Exception
	{
		//Formats in constants file.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		String oldId = new CancelDAO().recentId();
		int lastDigits=1;
		String newId=null;
		String subOldId=null;
		String output = null;
		String str=sdf.format(new Date());
		String pattern="000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
	
		if(oldId!=null)
		{
			subOldId=oldId.substring(0,8);
			if(str.equalsIgnoreCase(subOldId))
			{
				int num=Integer.parseInt(oldId.substring(8));
				while(lastDigits<=num && num<999)
				{
					lastDigits++;
				}
				output = myFormatter.format(lastDigits);
				newId=str+output;
			}
			else
			{
				output = myFormatter.format(lastDigits);
				newId=str+output;
			}
		}
		else
		{
			output = myFormatter.format(lastDigits);
			newId = str+output;
		}
		return newId;
	}
	
	public CancelBean payDetails(CancelBean canclebean) throws GeneralException, Exception
	{
		CancelBean bean = new CancelDAO().payDetails(canclebean);
		return bean;
	}
}