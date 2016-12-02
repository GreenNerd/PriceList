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


function getTree() {
  var data = [
    {
      text: "Parent 1",
      nodes: [
        {
          text: "Child 1",
          nodes: [
            {
              text: "Grandchild 1"
            },
            {
              text: "Grandchild 2"
            }
          ]
        },
        {
          text: "Child 2"
        }
      ]
    },
    {
      text: "Parent 2"
    },
    {
      text: "Parent 3"
    },
    {
      text: "Parent 4"
    },
    {
      text: "Parent 5"
    }
  ];
  return data;
}
