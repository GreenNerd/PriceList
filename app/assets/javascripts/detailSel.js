$('*').on("click", "#count_add", function(){
  var t = $("#count_text_box");
  $('#count_min').attr('disabled', true);
  t.val(parseInt(t.val()) + 1);
  if (parseInt(t.val()) != 1){
    $('#count_min').attr('disabled', false);
  }
});
$('*').on("click", "#count_min", function(){
  var t = $("#count_text_box");
  t.val(parseInt(t.val()) - 1);
  if (parseInt(t.val()) == 1){
    $('#count_min').attr('disabled', true);
  }
});
