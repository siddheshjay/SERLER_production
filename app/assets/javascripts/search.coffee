# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

###*
# Created by chandler on 2016. 9. 10..
###


$(document).on 'nested:fieldAdded', (event) ->
  # this field was just inserted into your form
  field = event.field
  return
$(document).on 'nested:fieldRemoved', (event) ->
  # this field was just inserted into your form
  field = event.field
  # it's a jQuery object already! Now you can find date input
  event.target.remove()
  return

ready = ->
  $("a[data-sort]").click (event)->
      sort_column(event.target)


  $("#search_form").on 'submit', ()->
      validateForm()


  datetime_mode =
    viewMode: 'days'
    format: 'YYYY-MM-DD'
  $('#fromdate').datetimepicker datetime_mode
  $('#todate').datetimepicker datetime_mode


  sort_column = (obj)->
    form = $("#search_form")
    sort_input = $("<input>").attr("type", "hidden").attr("name", "sort").val($(obj).attr("data-sort"))
    direction_input = $("<input>").attr("type", "hidden").attr("name", "direction").val($(obj).attr("data-direction"))
    sort_input.appendTo(form)
    direction_input.appendTo(form)
    return $("#search_form").submit()


	validateForm = ->
		ret_val = true
		search_option_list = $('.search_field_option')
		search_operation_list = $('.search_operation')
		i = 0
		while i < search_option_list.length
			search_option_val = $(search_option_list[i]).val()
			search_operation_val = $(search_operation_list[i]).val()
			if 'credibility_rate' == search_option_val
				#interger
				if 'ILIKE' == search_operation_val or 'NOT ILIKE' == search_operation_val
					ret_val = false
					break
			else
				#incase of not integer
				if '<' == search_operation_val or '>' == search_operation_val
					ret_val = false
					break
			i++
		if false == ret_val
			$('#invalid_pop').modal()
		ret_val
		return

$(document).ready ready
$(document).on "page:load", ready
