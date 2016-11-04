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
