$(document).ready(function(){
  function show_checkbox () {
    $('div.card input').css('display', 'block');
  };

  function hide_checkbox () {
    if ($('input:checkbox:checked').length==0) {
      $('div.card input').css('display', 'none');
    };
  };

  $('div.card').on("mouseover", show_checkbox);

  $('div.card').on("mouseout", hide_checkbox);
});