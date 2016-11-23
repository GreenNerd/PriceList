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

// Add(+/1) Button Number Incrementers
$("*").on("click", ".incr-btn", function(e) {
  var $button = $(this);
  var oldValue = $button.parent().find("input").val();
  if ($button.text() == "+") {
    var newVal = parseFloat(oldValue) + 1;
  } else {
    // Don't allow decrementing below 1
    if (oldValue > 1) {
      var newVal = parseFloat(oldValue) - 1;
    } else {
      newVal = 1;
    }
  }
  $button.parent().find("input").val(newVal);
  e.preventDefault();
});


// Add to cart from select page
function beforeSubmit() {
  if ($('input[type=radio]:checked').length == 0) {
    $.alert({
      icon: 'fa fa-warning',
      title: '',
      content: '请选择型号！',
    });
    return false;
  }
  var sid = $('input[type=radio]:checked').attr('id');
  var qua = $("#count_text_box").val();
  $("#form-quantity").val(qua);
  $("#form-sku-id").val(sid);
  $("#add-to-cart").bind("ajax:success", submitSuccess());
  return true;
}

function submitSuccess() {
  $.confirm({
    icon: 'fa fa-check',
    title: "",
    content: '添加成功，请继续购物或者到购物车结算',
    autoClose: 'close|2000',
    buttons: {
      close: function() {
      }
    }
  });
}
