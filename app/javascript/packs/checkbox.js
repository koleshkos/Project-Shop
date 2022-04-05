$(document).ready(function(){
  $('#btn-check-box-set').on("click", function(){
    $('input').prop('checked', true)
  })

  $('#btn-check-box-reset').on("click", function(){
    $('input').prop('checked', false)
  })
})
