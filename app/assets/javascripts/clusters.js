function makeDefaultCluster(radioCluster) {
  defaultCluster = radioCluster.value;
  $.ajax({
    url: '/cluster_users',
    type: 'PATCH',
    data: { defaultCluster: defaultCluster },
    success: function(result) {
      $("tr").removeAttr("style");
      $("#cluster" + defaultCluster).css("font-weight", "bold");
    },
    error: function(jqXHR, textStatus, errorThrown) {
      alert(textStatus + " and " + errorThrown);
    }
  });
}
