<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<noscript><center><h4>
JavaScript is turned off in your web browser. Turn it on to take full advantage of this site, then refresh the page.
</h4></center></noscript>
<head>
<link href="CSSs/jquery-ui.css" rel="stylesheet">
<script src="Scripts/jquery-1.10.2.js"></script>
<script src="Scripts/jquery-ui.js"></script> 
<script type="text/javascript" src="Scripts/SelectVehicle.js"></script>
<script type="text/javascript" src="Scripts/states.js"></script>
<script type="text/javascript" src="Scripts/Date.js"></script>
<script type="text/javascript" src="Scripts/vehiclevalidation.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>


<body>
<%@include file="Header.jsp" %>
<center><h4>Vehicle Registration</h4>
<%if(request.getAttribute("errMsg")!=null)
	 {%>
	<h5><%=request.getAttribute("errMsg") %></h5>
	<% }
	 %>
</center>
      <form action="VehicleRegController" name="Veg" onsubmit="return vehiclevalidate()" method="post">
      <table align="center">
		<tr><td>Owner Name</td><td><input type="text" name="ownername" maxlength="20" autocomplete="off" pattern="[a-zA-Z ].{4,20}"   required title="Minimum 5 letters & maximum 20 letters"></td></tr>
		<tr><td>Vehicle Registration Number</td><td><input type="text"name="regnumber" maxlength="10" autocomplete="off" pattern="[a-zA-Z]{2}[0-9]{2}[a-zA-Z]{1,2}[0-9]{4}" required title="EX:AA00BB1111, YY00Z2222"></td></tr>
		<tr><td>Usage type</td><td> <select name="usage">
									<option value="Personal" selected="selected">Personal</option>
									<option value="Public">Public</option>
									</select> </td></tr>
		<tr><td>Vehicle Registration State</td><td>
				<select onchange="set_state(this,country,city_state)" required size="1" name="vrs">
				<option value="" selected="selected">Location</option>
					<script type="text/javascript">
						setRegionsss(this);
					</script> 
				</select>
			</td></tr>
	
		 <tr><td>Vehicle Type</td><td>
			<select name="vehicletype" id="vehicletype" required onchange="setmanufacture();">
  				<option value="">Select Vehicle Type</option>
  				<option value="TWOWHEELER">TWO WHEELER</option>
  				<option value="FOURWHEELER">FOUR WHEELER</option>
			</select>
		</td></tr>
		<tr><td>Manufacturer</td><td>
			<select required name="manu" id="manu" onchange="setmodel();">
  				<option value="">select Vehicle type first</option>
			</select>
		</td></tr>
		<tr><td>Model</td><td>
			<select name="mode" required id="mode">
  				<option value="">select Manufacturer first</option>
			</select>
		</td></tr>
		
		<tr><td>Year Make</td><td><input type="text"  maxlength="4" onkeypress='return event.charCode >= 48 && event.charCode <= 57' name="YearMake" autocomplete="off"  pattern="[0-9].{3,3}"  required title="Enter Year in 4 digit formate"></td></tr>
		<tr><td>Engine Number</td><td><input type="text" name="EngineNumber" maxlength="17" autocomplete="off" pattern="[0-9A-Za-z].{16,16}"   required title="Enter 17 alphanumeric Engine number"></td></tr>
		<tr><td>Registering Location</td><td><select onchange="set_state(this,country,city_state)" required size="1" name="vrl">
				<option value="" selected="selected">Location</option>
					<script type="text/javascript">
						setRegionsss(this);
					</script> 
				</select></td></tr>
		<tr><td>Date Of Purchase</td><td><input type="text" id="ramkie"  name="dop" required ></td></tr>
		<tr><td>Price</td><td><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' maxlength="8" name="Price" autocomplete="off"  pattern="[0-9].{4,7}"  required title="Minimum 10000 & maximum 99999999 "></td></tr>
		<tr><td></td><td><input type="submit"  value="Register"></td><td><input type="reset"  value="Reset"></td></tr>
	</table>
</form>
</body>
</html>