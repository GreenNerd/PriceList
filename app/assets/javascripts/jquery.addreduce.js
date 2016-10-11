$(document).ready(function(){
  var t = $("#text_box");
  $('#min').attr('disabled', true);
  $('#add').click(function(){
    t.val(parseInt(t.val()) + 1);
    if (parseInt(t.val()) != 1){
      $('#min').attr('disabled', false);
    }
  });
  $('#min').click(function(){
    t.val(parseInt(t.val()) - 1);
    if (parseInt(t.val()) == 1){
      $('#min').attr('disabled', true);
    }
  });
});
