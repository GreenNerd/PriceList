/* Shopping-cart
 ***********************
 */
// Deleting items
$('body').on("click", ".shopping-cart .delete a i", function(){
  var $target = $(this).parent().parent().parent();
  var $positions = $('.shopping-cart .item');
  $target.hide(300, function(){
    $.when($.target.remove()).then( function() {
      if($positions.length === 1) {
        $(".shopping-cart .items-list").remove();
        $(".shopping-cart .title").text("Shopping cart is empty!");
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
