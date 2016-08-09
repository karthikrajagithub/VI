
// Manufacturer lists
var manufacture = new Array();

manufacture['TWOWHEELER'] = new Array('Select Manufacture','HERO','BAJAJ','TVS','MAHINDRA BIKE');
manufacture['FOURWHEELER'] = new Array('Select Manufacture','HONDA','TOYOTA','HYUNDAI','MAHINDRA','CHEVROLET','SKODA','VOLKSWAGEN');


// Model lists
var model = new Array();

model['TWOWHEELER'] = new Array();
model['TWOWHEELER']['HERO'] = new Array('SPLENDAR','SPLENDAR PLUS','PASSION PLUS','ACTIVA');
model['TWOWHEELER']['BAJAJ'] = new Array('PULSAR','DISCOVER','BOXER');
model['TWOWHEELER']['TVS'] = new Array('VICTOR GLX','SPORT','APACHE','XL SUPER','HEAVY DUTY','SCOOTY PEP');
model['TWOWHEELER']['MAHINDRA BIKE'] = new Array('DURO');

model['FOURWHEELER'] = new Array();
model['FOURWHEELER']['HONDA'] = new Array('ACCORD','CITY','AMAZE');
model['FOURWHEELER']['TOYOTA'] = new Array('ETIOS');
model['FOURWHEELER']['HYUNDAI'] = new Array('VENTURE','ACCENT');
model['FOURWHEELER']['MAHINDRA'] = new Array('SCORPIO','XUV');
model['FOURWHEELER']['CHEVROLET'] = new Array('TAVERA','SPARK');
model['FOURWHEELER']['SKODA'] = new Array('FABIA');
model['FOURWHEELER']['VOLKSWAGEN'] = new Array('PUNTO');


function setmanufacture() {
  cntrySel = document.getElementById('vehicletype');
  stateList = manufacture[cntrySel.value];
  changeSelect('manu', stateList, stateList);
  setCities();
}

function setmodel() {
  cntrySel = document.getElementById('vehicletype');
  stateSel = document.getElementById('manu');
  cityList = model[cntrySel.value][stateSel.value];
  changeSelect('mode', cityList, cityList);
}

function changeSelect(fieldID, newOptions, newValues) {
  selectField = document.getElementById(fieldID);
  selectField.options.length = 0;
  for (i=0; i<newOptions.length; i++) {
    selectField.options[selectField.length] = new Option(newOptions[i], newValues[i]);
  }
}

function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}

addLoadEvent(function() {
  setStates();
});









