//= require_self
function Add(node)
{
  var inputs=node.parentNode.getElementById("input");
  var a=new Number(inputs[1].value);
  a=a+1;
  inputs[1].value=""+a;
}
function Sub(node)
{
  //node.parentNode的类型为单元格
  var inputs=node.parentNode.getElementById("input");
  var a=new Number(inputs[1].value);
  a=a-1;
  inputs[1].value=inputs[1].value-1;
}
