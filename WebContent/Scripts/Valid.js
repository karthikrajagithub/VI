function form_validation()
{

		var policyregex = /^[a-zA-Z]{2}[0-9]{6}/;
		var mobileregex = /^[7-9]{1}[0-9]{9}/;

		
		var contact = document.forms["directform"]["contact"].value;
		var policyamount = document.forms["directform"]["policyamount"].value;
		var policyid = document.forms["directform"]["policyid"].value;
		

		
		if (!policyid.match(policyregex)) {
			
	        alert("Enter valid Id");
	        document.getElementById("error").innerHTML="Enter valid Id ";
	        document.directform.policyid.value="";
	        document.directform.policyid.focus();
	        return false;
		}
		else{
			 document.getElementById("error").innerHTML="";
		}
		
		if (isNaN(policyamount)) {
			
	        document.getElementById("error1").innerHTML="Enter valid Amount ";
	        document.directform.policyamount.value="";
	        document.directform.policyamount.focus();
	        alert("Enter valid Amount");
	        return false;
		}
		else{
			document.getElementById("error1").innerHTML="";
		}
		
		if (!contact.match(mobileregex)) {
			
			document.getElementById("error2").innerHTML="Enter valid Mobile number ";
	        alert("Enter valid Mobile number");
	        document.directform.contact.focus();			
			return false;
		}
		else{
			document.getElementById("error2").innerHTML="";
		}
		
}



function login_validation()
{
	var custid = document.forms["loginform"]["custid"].value;
//	var pass = document.forms["loginform"]["pass"].value;
	
	var custidregex = /^[0-9]{10}/;
//	var passregex = /^((?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@#$%!]).{6,20})/;
	if (!custid.match(custidregex)) {
        alert("Enter valid Id");
        return false;
	}
//	if (!pass.match(passregex)) {
//        alert("Enter valid Password");
//        return false;
//	}
}

function payconfirm()
{
	var user_choice = window.confirm('Would you like to continue?');
	if(user_choice==true)
	{
		return true;  // you can also use element.submit() if your input type='submit' 
	} 
	else
	{
		return false;
	}
}

