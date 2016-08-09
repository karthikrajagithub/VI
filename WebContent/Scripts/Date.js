 $(function() {
            $( "#ramkie" ).datepicker({changeMonth: true,
            							changeYear: true,
            							dateFormat:'yy-mm-dd',
            							yearRange: "1910 : dateToday.getFullYear()",
            							maxDate: '@maxDate',
            							showButtonPanel: true
            							}
            							);
 				}
 	); 

 $(function() {
     $( "#anudeep" ).datepicker({changeMonth: true,
     							changeYear: true,
     							dateFormat:'yy-mm-dd',
     							yearRange: "1910 : dateToday.getFullYear()",
     							maxDate: '@maxDate',
     							showButtonPanel: true
     							}
     							);
			}
); 