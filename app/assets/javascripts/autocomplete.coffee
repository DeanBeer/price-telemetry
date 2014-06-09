init_autocomplete = ->
  $('[data-autocomplete-source]').each (k, v) ->
    $(v).autocomplete
      source: $(v).data('autocomplete-source')

$(document).ready(init_autocomplete)
$(document).on('page:load', init_autocomplete)


init_brand_autocomplete = ->
  input = $("#brand_name")
  brewery_input = $("#brewery_name")
  brand_list = input.data('brands').map( (brand, i) ->
    {
      label: brand.name + " - " + brand.brewery
      value: brand.name
      brewery: brand.brewery
    }
  )
  input.autocomplete
    source: (request, response) ->
      matcher = new RegExp($.ui.autocomplete.escapeRegex(request.term), "i" )
      response( $.grep( brand_list, (item) ->
        matcher.test(item.value)
      ))
    select: (event, ui) ->
      brewery_input.val(ui.item.brewery)

$(document).ready(init_brand_autocomplete)
$(document).on('page:load', init_brand_autocomplete)
