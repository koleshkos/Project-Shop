$(document).ready(() => {
  $('div.card').on("mouseover", () => {
    $('div.card input').css('display', 'block');
  });

  $('div.card').on("mouseout", () => {
    if ($('input:checkbox:checked').length==0) {
      $('div.card input').css('display', 'none');
    };
  });
});