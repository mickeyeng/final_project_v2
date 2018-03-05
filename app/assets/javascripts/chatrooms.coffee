
handleVisiblityChange = ->
    $strike = $(".strike")
    if $strike.length > 0
      chatroom_id = $("[data-behavior='messages']").data("chatroom-id")
      App.last_read.update(chatroom_id)
      $strike.remove()


$(document).on "turbolinks:load", ->
  $(document).on "click", handleVisiblityChange
 
  submit_message = () ->
  $('#new_message').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()


  

    chatroom_id = $("[data-behavior='messages']").data("chatroom_id")
    body        = $("#message_body")
    console.log "submitted form"

    App.chatrooms.send_message(chatroom_id, body.val())

    body.val("")
     




