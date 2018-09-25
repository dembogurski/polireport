

var current_position, current_accuracy;
var map;

$(document).ready(function(){
    initMap();
    
    
});


function initMap(){
      
    //var  map = L.map('mapid').setView([-27.2622902, -55.8148427], 13);
    map = L.map('mapid');
    
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=sk.eyJ1IjoiZGVtYm9ndXJza2kiLCJhIjoiY2ptaTV6YTNrMDB0czNwbXd2NzFjNWFuNSJ9.YfgQMbBK7vcRoLA1aPwvAg', {
    //attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
    maxZoom: 18,
    id: 'mapbox.streets',
    accessToken: 'sk.eyJ1IjoiZGVtYm9ndXJza2kiLCJhIjoiY2ptaTV6YTNrMDB0czNwbXd2NzFjNWFuNSJ9.YfgQMbBK7vcRoLA1aPwvAg'
   }).addTo(map);
   
   map.on('locationfound', onLocationFound);
   map.on('locationerror', onLocationError);
   locate();
   setInterval(locate, 3000);
}

// placeholders for the L.marker and L.circle representing user's current position and accuracy    
   

    function onLocationFound(e) {
      // if position defined, then remove the existing position marker and accuracy circle from the map
      if (current_position) {
          map.removeLayer(current_position);
          map.removeLayer(current_accuracy);
      }

      var radius = e.accuracy / 4;

      current_position = L.marker(e.latlng).addTo(map)
        .bindPopup("Menos de " + radius + " mts.").openPopup();

      current_accuracy = L.circle(e.latlng, radius).addTo(map);
    }

    function onLocationError(e) {
      console.warn(e.message);
    }

   

    // wrap map.locate in a function    
    function locate() {
      map.locate({setView: true, maxZoom: 18});
    }
 