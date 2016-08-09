////////////////////////////////////////////////////////////////////////////
// states.js ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////
var indianstates = Object();

indianstates['Andaman & Nicobar']='';
indianstates['Andhra Pradesh']='';
indianstates['Arunachal Pradesh']='';
indianstates['Assam']='';
indianstates['Bihar']='';
indianstates['Chandigarh']='';
indianstates['Chhattisgarh']='';
indianstates['Dadra & Nagar Haveli']='';
indianstates['Daman and Diu']='';
indianstates['Delhi']='';
indianstates['Goa']='';
indianstates['Gujarat']='';
indianstates['Haryana']='';
indianstates['Himachal Pradesh']='';
indianstates['Jammu and Kashmir']='';
indianstates['Jharkhand']='';
indianstates['Karnataka']='';
indianstates['Kerala']='';
indianstates['Lakshadweep']='';
indianstates['Madhya Pradesh']='';
indianstates['Maharashtra']='';
indianstates['Manipur']='';
indianstates['Meghalaya']='';
indianstates['Mizoram']='';
indianstates['Nagaland']='';
indianstates['Odisha']='';
indianstates['Puducherry']='';
indianstates['Punjab']='';
indianstates['Rajasthan']='';
indianstates['Sikkim']='';
indianstates['Tamil Nadu']='';
indianstates['Telangana']='';
indianstates['Tripura']='';
indianstates['Uttar Pradesh']='';
indianstates['Uttarakhand']='';
indianstates['West Bengal']='';

////////////////////////////////////////////////////////////////////////////

var ssss = Object();

//Africa
ssss['HERO'] = 'Splendar|Splendar Plus|Passion Plus|Activa';
ssss['BAJAJ'] = 'Pulsar|Discover|Boxer';
ssss['TVS'] = 'Victor GLX|Sport|Apache|XL Super|Heavy Duty|Scooty PEP';
ssss['MAHINDRA BIKE'] = 'Duro';


//Asia
ssss['HONDA'] = 'Accord|City|Amaze';
ssss['TOYOTA'] = 'Etios';
ssss['HYUNDAI'] = 'Venture|Accent';
ssss['MAHINDRA'] = 'Scorpio|XUV';
ssss['CHEVROLET'] = 'Tavera|Spark';
ssss['SKODA'] = 'Fabia';
ssss['VOLKSWAGEN'] = 'Punto';

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

function setRegionsss()
{
	for (region in indianstates)
		document.write('<option value="' + region + '">' + region + '</option>');
}

function set_state(oVehicleType, oManufacturer, oModel)
{
	var manufacturerArr;
	oManufacturer.length = 0;
	oModel.length = 0;
	var region = oVehicleType.options[oVehicleType.selectedIndex].text;
	if (indianstates[region])
	{
		oManufacturer.disabled = false;
		oModel.disabled = true;
		oManufacturer.options[0] = new Option('Manufacturer','');
		manufacturerArr = indianstates[region].split('|');
		for (var i = 0; i < manufacturerArr.length; i++)
			oManufacturer.options[i + 1] = new Option(manufacturerArr[i], manufacturerArr[i]);
		document.getElementById('txtregion').innerHTML = region;
		
	}
	else oManufacturer.disabled = true;
}
/*
function set_state1(oManufacturer, oModel)
{
	var modelArr;
	oModel.length = 0;
	var country = oManufacturer.options[oManufacturer.selectedIndex].text;
	if (ssss[country])
	{
		oModel.disabled = false;
		oModel.options[0] = new Option('Model','');
		modelArr = ssss[country].split('|');
		for (var i = 0; i < modelArr.length; i++)
			oModel.options[i+1] = new Option(modelArr[i],modelArr[i]);
		
	}
	else oModel.disabled = true;
}
*/




