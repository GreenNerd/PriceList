/* Shopping-cart
 ***********************
 */

// Items changed
$('*').on('change', ".shopping-cart .qnt-count .tb-form-control", function(){
  alert("test");
});

$('*').on('change', ".shopping-cart .qnt-count #sel-type", function(){
  var str = $(".shopping-cart .qnt-count select option:selected").val();
  alert(str);
});

$('*').on('change', ".shopping-cart", function(){
  $positions = $('.shopping-cart .qnt-count select');
  $positions.each(function(){
    $(this).change(function(){
      var str = $(this).find(":selected").val();
      alert(str);
      break;
    });
  });
});

// Deleting items
$('*').on("click", ".shopping-cart .delete a i", function(){
  var $target = $(this).parent().parent().parent();
  var $positions = $('.shopping-cart .item');
  $target.hide(300, function(){
    $.when($target.remove()).then( function() {
      if($positions.length === 1) {
        $(".shopping-cart .items-list").remove();
      }
    });
  });
});

// Update items
$('body').on("click", ".shopping-cart #update-cart", function() {
  $positions = $('.shopping-cart .item');
  $positions.each(function(){
    qua = $(".shopping-cart .item .qnt-count :input").val();
    oid = $(".shopping-cart #oi-id").val();

    data = {"Oid": oid, "Uquantity": qua};
    url = "<%= order_item_path(#{oid}) %>";
    $.ajax({
      url: url,
      data: data,
      dataType: "json",
      cache: false,
      type: "put"
    });
  });
});

// Ajax send data
$("*").on("click", "#addtocart1", function(e){
  typ = ""
  qua = 1

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
