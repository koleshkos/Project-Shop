$(document).ready(() => {
  $('#btn-check-box-set').on("click", () => {
    $('input').prop('checked', true);
  });

  $('#btn-check-box-reset').on("click", () => {
    $('input').prop('checked', false);
  });

  const delete_request = () => {
    var product_ids = [];
    $('input:checkbox:checked').each(function(){
      product_ids.push($(this).val());
    });    

    var product_ids_hash = { product_ids: product_ids}

    var ids = $.param(product_ids_hash);

    $.ajax({
      url: '/admin/products?'+ids,
      type: 'POST',
      data: { _method: 'DELETE' }, 
      success: function() {
        location.reload();
      }
    });
  };

  $('#btn-check-box-delete').on("click", delete_request);
  
  $('input:checkbox').on("click", () => {
    if ($('input:checkbox:checked').length>0) {
      $('div.card input').css('display', 'block');
      $(".btn-tool").css("display", "inline");
    };
  });

  $('input:checkbox').change(() => {
    if ($('input:checkbox:checked').length == 0) {
      $('div.card input').css('display', 'none');
      $(".btn-tool").css("display", "none");
    };
  });
});
