$(document).ready(function() {
  var t = $("#count_text_box");
  $('#count_min').attr('disabled', true);
  $('#count_add').click(function(){
    t.val(parseInt(t.val()) + 1);
    if (parseInt(t.val()) != 1){
      $('#count_min').attr('disabled', false);
    }
  });
  $('#count_min').click(function(){
    t.val(parseInt(t.val()) - 1);
    if (parseInt(t.val()) == 1){
      $('#count_min').attr('disabled', true);
    }
  });
});
