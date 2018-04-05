App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='#{data.chatroom_id}']")
    if active_chatroom.length > 0

      if document.hidden
        if $(".strike").length == 0
          active_chatroom.append("<div class='strike'><span>Unread Messages</span></div>")

        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body})

      else
        App.last_read.update(data.chatroom_id)

      # Insert the message
      active_chatroom.append("<div class='chat-box'><div class='chat-user-info'><img class='faces-chat' src='#{data.avatar}'>  <p class='chat-text-username' #{data.username}</p></div><p class='chat-text'>#{data.body}</p>")

    else
      $("[data-behavior='chatroom-link'][data-chatroom-id='#{data.chatroom_id}']").append("<p id='unread-message'>Unread message</p>") 

  send_message: (chatroom_id, avatar, message ) ->
    @perform "send_message", {chatroom_id: chatroom_id, avatar: avatar, body: message}