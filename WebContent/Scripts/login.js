
function validateLogin() {
	var loginid=document.log.login.value;
    if (loginid==null || loginid=="") 
    	{
        alert("LoginId cannot be left blank...!!!");
        return false;
    	}
    if (isNaN(loginid))
	{
    alert("login id is only numeric !!!");
    return false;
	}
    var age = getAge();
    if (age>80)
    	{
    	alert("please enter the age under the correct 80 years");
    	return false;
    	}
    if (age<18)
    	{
    	alert("required age is above 18!!");
    	}
    var pass=document.log.password.value;
    if (pass==null || pass=="") 
    	{
        alert("U forgot Password");
        return false;
    	}
}
function validateRegister()
{
    var fname=document.reg.firstname.value;
    if (fname==null || fname=="") 
    	{
        alert("please fill up the name...!!!");
        return false;
    	}
    var lname=document.reg.lastname.value;
    if (lname==null || lname=="")
    	{
    	alert("please fill lastname, if no lastname please fill with - ");
    	return false;
    	}
    var pass1 = document.reg.password.value;
    var pass2 = document.reg.confirmpassword.value;
    if (pass1!=pass2) 
    {
        alert("Password and Confirm Password must be same...!!!");
        return false;
    }
    var regpass = document.reg.password.value;
    if (regpass==null || regpass=="")
    	{
    	alert("please enter password");
    	return false;
    	}
    if(!regpass.match(/^((?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[@#$%!]).{8,20})/))
    	{
         alert("Password must contain:\n" +
        		  "Minimum 8 chars and max 20 chars\n" +
                  "Atleast 1 special char( @#$%! )\n" +
                  "Atleast 1 number !!!");
        return false;
    	}
    var cnfpass = document.reg.confirmpassword.value;
    if(cnfpass==null || cnfpass=="")
    	{
    	alert("Confirm password cannot be empty ");
    	return false;
    	}
    var contact = document.reg.phone.value;
    if(contact==null || contact=="")
    	{
    	alert("Contact number cannot be left blank...!!!");
    	return false;
    	}
    if(isNaN(contact))
    	{
    	alert("Contact number is only numeric");
    	return false;
    	}
    if(contact.length!=10)
    	{
    	alert("contact number should contain 10 digits");
    	return false;
    	}
    var email = document.reg.emailid.value;
    if (email == null || email == "") 
    {
        alert("Email ID field cannot be left blank...!!!");
        return false;
    }
  
    if (!email.match(/^(?=.*[@])(?=.*[.]).{8,35}$/))
      {
      alert("Enter vaild Email-ID...!!!");
      return false;
      }
   


    var birthDay = document.reg.dop.value;
    var DOB = new Date(birthDay.toString);
    var today = new Date();
    var age = today.getTime() - DOB.getTime();
    age = Math.floor(age / (1000 * 60 * 60 * 24 * 365.25));
    if(age<18  || age>80)
    	{
    		alert("To register you should be of age group 18-80");
    		return false;
    	}
    
    
    var town = document.reg.city.value;
    if (town==null || town=="")
    	{
    	alert("City cannot be empty..");
    	return false;
    	}
    if(!town.match(/^[a-zA-Z]*$/))
    	{
        alert("Enter a valid city name...!!!\n" +
        		  "No Spaces");
        return false;
    	}
    var province = document.reg.state.value;
    if(province==null || province=="")
    	{
    	alert("State cannot be null..");
    	return false;
    	}
    if(!province.match(/^[a-zA-Z]*$/))
    	{
        alert("Enter a valid state name...!!!");
        return false;
    	}	
    var pin = document.reg.pincode.value;
    if (isNaN(pin))
	{
	alert("Pincode is numeric..");
	return false;
	}
    if (pin.length!=6)
    	{
    	alert("Pincode can only be 6 digits");
    	return false;
    	}
    
 
}
