$(document).ready(function() {
  // add to footer
  $("#menu-toggle").click(function(e){
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
  });
});