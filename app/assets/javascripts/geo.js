window.onload = function() {

        // Check to see if the browser supports the GeoLocation API.
        if (navigator.geolocation) {
                // If it does, create an object with the location coordinates
                navigator.geolocation.getCurrentPosition(function(position) {
                        var lat = position.coords.latitude;
                        var lon = position.coords.longitude;

                        // Then render the map with the Lat/Lon variables set above.
                        showMap(lat, lon);
                });
        } else {
                // If the browser doesn't support GeoLocation, notify the user.
                document.write('Your browser does not support GeoLocation :(');
        }
}

// Show the user's position on the Google map.
function showMap(lat, lon) {
        // Create a LatLon object with the GPS coordinate variables.
        var usrLatLng = new google.maps.LatLng(lat, lon);

        // Create the Map Options
        var mapOptions = {
          zoom: 12,
          center: usrLatLng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };

      // Render the Map and apply the map options
      window.map = new google.maps.Map(document.getElementById('map'), mapOptions);
        // var size = new google.maps.Size(38.0, 95.0);
        // var origin = new google.maps.Point(0, 0);
        // var anchor = new google.maps.Point(13.0, 18.0);
        // var vineImage = new google.maps.MarkerImage('<%= image_path 'markers/leaf-green.png' %>',
        //   size,
        //   origin,
        //   anchor
        // );
      // Add the usersLatLon Marker to the Map using the Google Maps animation function
      var marker = new google.maps.Marker({
        animation: google.maps.Animation.DROP,
        // icon: vineImage,
        map: map,
        position: usrLatLng
        // shadow   : markerShadowImage
      });

        // Listener function adds markers to the map when the map is moved by mousedown(dragging)
      window.addedMarkers = {}
      google.maps.event.addListener(map,'mousedown',function(event) {
        var lat = event.latLng.lat();
        var lon = event.latLng.lng();
        addData(lat, lon);
      })
}

// function that adds map data objects by calling it from the /wineries route target method.
var addData = function(lat, lon){

  if(window.maprIcons){ // If the window has markers for new objects, fine. If not, get data objects and add markers.
     addMarkers(lat, lon, maprIcons)
  } else {
    $.get("/wineries")
      .done(function(data){
         window.maprIcons = data;
         addMarkers(lat, lon, maprIcons)
      })
  }
}

// Radius function allows changing the radius in which markers are added to the map
var checkDist = function(lat, lon,i, data, radius){
 return Math.sqrt(Math.pow(lat - data[i]["lat"],2)+Math.pow(lon - data[i]["lon"], 2) ) < radius;
}

// Function that iterates through map objects and adds map markers based on the viewport size and radius.
var addMarkers = function(lat, lon, data){
     for (var i =0; i < data.length; i++) {
      if( addedMarkers[i] == undefined && checkDist(lat,lon,i,data, .3)){
        addedMarkers[i] = true;
        var wineLatLng = new google.maps.LatLng(data[i]["lat"],data[i]["lon"]);
        var marker = new google.maps.Marker({
          animation: google.maps.Animation.DROP,
          map: map,
          position: wineLatLng
       });
      }
    };
}

// google.maps.event.addListener(marker, 'click', function() {
//       if(activeInfoWindow) {
//         activeInfoWindow.close();
//       }
//       var infoWindow = new google.maps.InfoWindow({
//         maxWidth: 210
//       });
//       google.maps.event.addListener(infoWindow, 'closeclick', function() {
//         isWindowOpen = false;
//       });
//       activeInfoWindow = infoWindow;
//       activeThingId = thingId;
//       activeMarker = marker;
//       $.ajax({
//         type: 'GET',
//         url: '/info_window',
//         data: {
//           'thing_id': thingId
//         },
//         success: function(data) {
//           // Prevent race condition, which could lead to multiple windows being open at the same time.
//           if(infoWindow === activeInfoWindow) {
//             infoWindow.setContent(data);
//             infoWindow.open(map, marker);
//             isWindowOpen = true;
//           }
//         }
//       });
//     });