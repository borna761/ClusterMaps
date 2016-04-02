var activityArray = [];
activityArray['childrenClasses'] = [];
activityArray['devotionalMeetings'] = [];
activityArray['juniorYouthGroups'] = [];
activityArray['studyCircles'] = [];
var tempActivity = [];
var map;
var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
var newIcon = iconBase + 'info-i_maps.png';
var icons = {
  childrenClasses: {
    name: 'Children\'s class',
    icon: iconBase + 'info-i_maps.png'
  },
  devotionalMeetings: {
    name: 'Devotional meeting',
    icon: iconBase + 'library_maps.png'
  },
  juniorYouthGroups: {
    name: 'Junior youth group',
    icon: iconBase + 'library_maps.png'
  },
  studyCircles: {
    name: 'Study circle',
    icon: iconBase + 'parking_lot_maps.png'
  }
};

function initMap() {
  var mapDiv = document.getElementById('map');
  map = new google.maps.Map(mapDiv, {
    zoom: 9,
    styles: [
      {
        featureType: 'poi',
        elementType: 'geometry',
        stylers: [
          { visibility: 'off' }
        ]
      }
    ]});

  geoLocate(map);

  var legend = document.getElementById('legend');
  for (var key in icons) {
    var type = icons[key];
    var name = type.name;
    var icon = type.icon;
    var div = document.createElement('div');
    div.innerHTML = '<img src="' + icon + '"> ' + name;
    legend.appendChild(div);
  }

  map.controls[google.maps.ControlPosition.RIGHT_TOP].push(document.getElementById('legend'));

  var features = setActivities();

  for (var i = 0, feature; feature = features[i]; i++) {
    addMarker(feature);
  }

  map.addListener('click', function(event) {
    addMarkerFromClick(event.latLng);
  });
}

function addMarker(activity) {
  var marker = new google.maps.Marker({
    position: activity.position,
    icon: icons[activity.type].icon,
    map: map
  });
  activityArray[activity.type].push(marker);
}

function addMarkerFromClick(location) {
  var marker = new google.maps.Marker({
    position: location,
    icon: newIcon,
    map: map
  });
  tempActivity.push(marker);
  $("#activity_location").val(location);
  $("#activityForm").show();
}

function toggleMarkers(category) {
  for (var i = 0; i < activityArray[category].length; i++) {
    if (activityArray[category][i].map == null) {
      activityArray[category][i].setMap(map);
    }
    else {
      activityArray[category][i].setMap(null);
    }
  }
}

function replaceTemporaryWithPermanentMarker() {
  var temporaryMarker = tempActivity.pop();
  var activityCategory = $("#activity_activity_type_id").val();
  var activityKeys = Object.keys(activityArray);
  temporaryMarker.setIcon(icons[activityKeys[activityCategory - 1]].icon);
  activityArray[activityKeys[activityCategory - 1]].push(temporaryMarker);
}

function cancelActivity() {
  $("#activityForm").hide();
  tempActivity.pop().setMap(null);
}

function geoLocate(map) {
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
      map.setCenter(initialLocation);
    }, function() {
      handleNoGeolocation(browserSupportFlag);
    });
  }
  // Browser doesn't support Geolocation
  else {
    browserSupportFlag = false;
    handleNoGeolocation(browserSupportFlag);
  }

  function handleNoGeolocation(errorFlag) {
    if (errorFlag == true) {
      alert("Geolocation service failed.");
      initialLocation = newyork;
    } else {
      alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = siberia;
    }
    map.setCenter(initialLocation);
  }
}
