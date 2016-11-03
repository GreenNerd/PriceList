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


// Ajax send data
$("*").on("click", "#addtocart2", function(e){
  typ = $('input[type=radio]:checked').val()
  qua = $("#count_text_box").val()

  data = {"product_type": typ, "quantity": qua};
  url = '/order_items';

  $.ajax({
    url: url,
    data: data,
    dataType: "json",
    cache: false,
    type: "post",
    success: function(response){
      if (response.success) {
        alert("ajax success");
      }else {
        alert("ajax error");
      }
    },
    error: function(response){
      if (response.success) {
        alert("data accepted!");
        $('#dialog').modal('toggle');
        }
    }
  });
});


// sumenu toggle
$("*").on("click", ".sb-toggle-submenu", function(){
  // Stop submenu toggle
  $('.sb-toggle-submenu').off('click');

	$submenu = $(this).parent().children('.sb-submenu');
	$(this).add($submenu).toggleClass('sb-submenu-active'); // Toggle active class.
	
	if ($submenu.hasClass('sb-submenu-active')) {
		$submenu.slideDown(200);
	} else {
		$submenu.slideUp(200);
	}
});
