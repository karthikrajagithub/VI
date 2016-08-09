.3+-6
 function vehiclevalidate() 
{
    var nam = document.Veg.ownername.value;
    if (nam == null || nam == "") 
    {
        alert("Owner Name field cannot be left blank...!!!");
        return false;
    }
    
    var nam = document.Veg.ownername.value;
    if (!nam.match(/^[a-zA-Z ]{5,20}/))
    {
        alert("Enter a valid name:\n"+
        		"Mininum 5 chars and max 20 chars");
        return false;
    }
    
    var vehicleRegnum = document.Veg.regnumber.value;
    if (vehicleRegnum == null || vehicleRegnum == "") 
    {
        alert("Vehicle Registration Number field cannot be left blank...!!!");
        return false;
    }
    
    var vehicleRegnum = document.Veg.regnumber.value;
    if(! vehicleRegnum.match(/^[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1,2}[0-9]{4}/))
    {
        alert("Enter a valid Vehicle Registration Number...!!!\n"+
        		"EX:AA00BB1111\n"+
        		"EX:YY00Z2222");
        return false;
    }
    
    var usage = document.Veg.usage.value;
    if (usage == null || usage == "") 
    {
        alert("Usage Type field cannot be left blank...!!!");
        return false;
    }
    var vehicleRegirstate = document.Veg.vrs.value;
    if (vehicleRegirstate == null || vehicleRegirstate == "") 
    {
        alert(" Vehicle Registration State field cannot be left blank...!!!");
        return false;
    }
    
    var vt = document.Veg.vehicletype.value;
    if (vt == null || vt == "") 
    {
        alert("Vehicle Type field cannot be left blank...!!!");
        return false;
    }
    
    var manufacturer = document.Veg.manu.value;
    if (manufacturer == null || manufacturer == "" || manufacturer=="Select Manufacture") 
    {
        alert("Manufacturer field cannot be left blank...!!!");
        return false;
    }
    
    var model1 = document.Veg.mode.value;
    if (model1 == null || model1 == "") 
    {
        alert("Model field cannot be left blank...!!!");
        return false;
    }
    
    var year = document.Veg.YearMake.value;
    if(! year.match(/^[1-2]{1}[0-9]{3}/))
    {
        alert("Enter a valid year ...!!! ");
        return false;
    }
    
    var current_year=new Date(document.Veg.dop.value).getFullYear();
    
    if((year < 1980) || (year > current_year))
        {
        alert("Year make should be in range 1980 to Year of purchase");
        return false;
        }
    
    
    var engineNumber = document.Veg.EngineNumber.value;
    if (engineNumber == null || engineNumber == "") 
    {
        alert("Engine Number field cannot be left blank...!!!");
        return false;
    }
    
    var engineNumber = document.Veg.engineNumber.value;
    if(!engineNumber.match(/^[a-zA-Z0-9]{17}/))
    {
        alert("Enter a valid Engine Number...!!! ");
        return false;
    }
    
    var registeringllocation = document.Veg.vrl.value;
    if (registeringllocation == null || registeringllocation == "") 
    {
        alert("Registering Location field cannot be left blank...!!!");
        return false;
    }
    
    var dateofpurchase = document.Veg.dop.value;
    if (dateofpurchase == null || dateofpurchase == "") 
    {
        alert("Date Of Purchase field cannot be left blank...!!!");
        return false;
    }
    
    var dop = document.Veg.dop.value;
    if(!dop.match( /^([0-9]{4})-([0-9]{2})-([0-9]{2})$/))
    {
        alert("Enter a valid Date ...!!! ");
        return false;
    }
    
    var price = document.Veg.Price.value;
    if (price == null || price == "") 
    {
        alert("Price field cannot be left blank...!!!");
        return false;
    }

    
    var price = document.Veg.price.value;
    if(!price.match(/^([1-9]\d{0,2}(\,\d{3})*|([1-9]\d*))(\.\d{2})?$/))
    {
        alert("Enter price only. For example: 11523.36 !!! ");
        return false;
    }
}

