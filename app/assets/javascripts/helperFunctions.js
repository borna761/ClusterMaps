function updateActivitySide(activityName) {
  var activityDiv = "#" + activityName + "Div";
  if ($(activityDiv).is(":visible")) {
    $(activityDiv).hide();
  }
  else {
    $(activityDiv).show();
  }
  viewActivityDetail(activityName);
}

function triggerMarker(activityId) {
  google.maps.event.trigger(findMarker(activityId), 'click');
}

function openInfoWindow(html, marker)
{
  closeInfoWindow();
  infowindow.setContent(html);
  infowindow.open(map, marker);
}

function closeInfoWindow(map)
{
  if (infowindow.getMap())
    infowindow.close();
}

function clearMarker(marker) {
  try {
    marker.setMap(null);
  }
  catch (error) {

  }
}

function geoLocate(map) {
  // Try W3C Geolocation (Preferred)
  if(navigator.geolocation) {
    browserSupportFlag = true;
    navigator.geolocation.getCurrentPosition(function(position) {
      initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
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
      alert("Geolocation service failed. Placing you in the middle of the earth.");
      initialLocation = new google.maps.LatLng(0, 0);
    } else {
      alert("Your browser doesn't support geolocation. We've placed you in Siberia.");
      initialLocation = new google.maps.LatLng(61.0137, 99.1967);
    }
    map.setCenter(initialLocation);
  }
}

function redirectCluster(clusterId) {
  window.document.location.href = "/activities/cluster/" + clusterId
}
