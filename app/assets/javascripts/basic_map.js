
  function initializeMap(id) {

    // Create new map
    var map = new mapboxgl.Map({
        container: id,
        style: 'mapbox://styles/mapbox/streets-v9',
        center: [-0.560759, 44.859291],
        zoom: 13,
        hash: true
    });

    // Add controls to map
    map.on('load', function(e) {
      // User Geolocation
      var user_location = geoCodeUser();
      console.log(user_location);
      if (user_location === undefined)
        { user_location = 'Rechercher une adresse'}

      // Search address control
      map.addControl(new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        placeholder: user_location
      }));

      // User Geolocation Button
      map.addControl(new mapboxgl.GeolocateControl({
        positionOptions: {
            enableHighAccuracy: true
        }
      }));

      // Navigation controls
      var nav = new mapboxgl.NavigationControl();
      map.addControl(nav, 'top-left');

      // Scale control
      map.addControl(new mapboxgl.ScaleControl({
          maxWidth: 80,
          unit: 'meter'
      }));
    });

    return map;

  }
