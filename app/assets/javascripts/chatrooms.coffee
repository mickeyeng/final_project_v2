$(document).on "turbolinks:load", ->
	$("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()



$(document).on 'turbolinks:load', ->
  submit_message()

submit_message = () ->
  $('#new_message').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()


