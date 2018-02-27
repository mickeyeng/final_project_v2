$(document).on "turbolinks:load", ->
	$("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      console.log "test"
      $('input').click()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    chatroom_id = $("[data-behavior='messages']").data("chatroom_id")
    body        = $("#message_body")
    console.log "submitted form"

    App.chatrooms.send_message(chatroom_id, body.val())

    body.val("")
     




