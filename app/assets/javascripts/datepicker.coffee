init_datepicker = ->
  $('.datepicker').each (i) ->
    $(this).datepicker({dateFormat: 'yy-mm-dd'})

$(document).ready(init_datepicker)
$(document).on('page:load', init_datepicker)
