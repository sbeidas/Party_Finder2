// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function findMe() {
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      document.getElementById('search').value = position.coords.latitude+' '+position.coords.longitude;
     document.forms[0].submit();
    }, function() {
      alert('We couldn\'t find your position.');
    });
  } else {
    alert('Your browser doesn\'t support geolocation.');
  }
}