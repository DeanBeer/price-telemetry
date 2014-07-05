init_hidden_control = ->
  $(document).on "mouseover", "li", (event) ->
    console.log event

console.log "hidden_control.coffee"

$(document).ready init_hidden_control
$(document).on 'page:load', init_hidden_control
