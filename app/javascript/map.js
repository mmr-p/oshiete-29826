function initMap() {
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({'address': window.address}, function(results, status) {
        if (status === 'OK') {
          let coordinate = results[0].geometry.location;
          let map = new google.maps.Map(document.getElementById("map"), {
            center: coordinate,
            zoom: 15
          });
          let transitLayer = new google.maps.TransitLayer();
          transitLayer.setMap(map);
        
          let marker = new google.maps.Marker({
            position: coordinate,
            map: map
          });
        }
    });
}

window.addEventListener('load', initMap)