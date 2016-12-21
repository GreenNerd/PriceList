
$('*').on('click', "#with_cgry", function(e){
  e.preventDefault();
  $('#dialog_cgry').modal('toggle');
  $('#dialog_cgry').modal('show');

  $('#dialog_cgry #cgry-tree').treeview({data: getTree()});
});

$('*').on('click', "#with_type", function(e){
  e.preventDefault();
  $('#dialog_type').modal('toggle');
  // $('#dialog_type').modal('show');

  $("#dimensionForSub").click(function(){
    type = $("#diensionForKey").val();
    $('#dimension-sep').append("<div class='alert alert-success alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" + type + "</div>");
    $('#dialog_type').modal('toggle');
  });
});

// new product page
$(document).ready(function(){
  $('#cgry-select').select2({
    placeholder: "请选择商品分类",
    allowClear: true
  });
  $('#new-cgry-select').select2({
    placeholder: "请选择商品分类",
    allowClear: true
  });
  $('#edit-cgry-select').select2({
    allowClear: true
  });
});

// Insert product stock keeping unit when create product
$('*').on('click', '#insert-pro-sku-btn', function(){
  res = $('.well:first').clone();
  inputs = res.find("input");
  inputs.each(function(){
    var num = parseInt(($(this).attr('id') + "").match(/\d+/g)) + 1;
    $(this).attr('id', ($(this).attr('id') + "").replace(/\d+/g, num));
    $(this).attr('name', ($(this).attr('name') + "").replace(/\d+/g, num));
  });
  $('#insert-pro-sku').append(res);
});


// Dynamic add fields in form
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".well").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}


// Mutilple delete
function handleClick(cb) {
  var $lines = $("#sitesadmin-checkbox tr input");
  for(var i=0; i< $lines.length; i++) {
    $lines[i].checked = !($lines[i].checked);
  }
}
