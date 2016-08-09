function validateTheft(){
	
	var fir=document.axe.Firno.value;
    if (isNaN(fir))
    	{
    	alert("FIR number is only numeric");
    	return false;
    	}
    if (fir.length!=10)
    	{
    	alert("FIR number should be ten digits.. So complete FIR number..");
    	return false;
    	}
	if (fir == null || fir == "") 
    	{
        alert("FIR number is mandatory. So please fill FIR no..!!!");
        return false;
    	}
	var PSB=document.axe.policestationbranch.value;
	if (PSB == null || PSB == "")
		{
		alert("police station branch is mandatory, fill up Police station branch..!!");
		return false;
		}
}

