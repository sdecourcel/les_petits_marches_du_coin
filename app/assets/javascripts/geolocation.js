// address in search bar
navigator.geolocation.getCurrentPosition(function(position) {
    var geocoder = new google.maps.Geocoder;
    var point = new google.maps.LatLng(
        position.coords.latitude, position.coords.longitude);
    geocoder.geocode({'latLng': point}, function (locations, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        locations.forEach(function(location) {
          if ($.inArray('street_address', location.types) != -1) {
            // $('#map').attr('placeholder', location.formatted_address);
            return location.formatted_address;
          }
        });
      }
    });
  });


// geocode in cookies
function geoCodeUser() {
  navigator.geolocation.getCurrentPosition(setGeoCookie);
}


function setGeoCookie(position) {
  var console_val = position.coords.latitude + "|" + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(console_val);
}
