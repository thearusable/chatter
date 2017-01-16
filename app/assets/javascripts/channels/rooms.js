jQuery(document).on('turbolinks:load', function() {

  var senderID = $('meta[name=current-user-id]').attr('content');
  var allChats = document.getElementsByClassName('messages');
  //split to two difrent
  for (var i = 0; i < allChats.length; i++) {
    messages_to_bottom(allChats[0]);

    var founded = false
    for(sub of App.cable.subscriptions.subscriptions){
      if(allChats[i].getAttribute(getChatAttribiute(allChats[i])) == ( JSON && JSON.parse(sub.identifier) || $.parseJSON(sub.identifier) ).room_id){
        founded = true
        break;
      }
    }

    if(founded == false){

      App.cable.subscriptions.create({
        channel: getChannel(allChats[i]),
        room_id: allChats[i].getAttribute(getChatAttribiute(allChats[i]))
      }, {
        connected: function() {
        },
        disconnected: function() {
        },
        received: function(data) {
          var message_boxes = $('.messages')
          id = ( JSON && JSON.parse(this.identifier) || $.parseJSON(this.identifier) ).room_id;
          for(var i = 0; i < message_boxes.length; i++){
            if (message_boxes[i].getAttribute(getChatAttribiute(message_boxes[i])) === id) {
              message_boxes[i].innerHTML += data['message'];
              messages_to_bottom(message_boxes[i]);
            }
          }
        },
        send_message: function(message, room_id) {
          return this.perform('send_message', {
            message: message,
            room_id: room_id,
            sender_id: senderID
          });
        }
      });
    }
  }

  $('textarea.message_body').keypress(function(event) {
      if (event.which == 13) {
          var msg = event.target.value
          var room_id = event.target.parentNode.getAttribute(getChatAttribiute(event.target.parentNode))

          for (value of App.cable.subscriptions.subscriptions){
            if(room_id === (JSON && JSON.parse(value.identifier) || $.parseJSON(value.identifier)).room_id){
              value.send_message(msg, room_id);
              break;
            }
          }

          event.target.value = ""
          return false;
       }
  });

});

function unsub(room_id) {
    for (value of App.cable.subscriptions.subscriptions){
      var temp = (JSON && JSON.parse(value.identifier) || $.parseJSON(value.identifier)).room_id
      if(room_id == temp ){
        App.cable.subscriptions.remove(value)
      }
    }
    return false;
}

function getChatAttribiute(chat){
  if (chat.getAttribute("data-room-id") != null){
    return "data-room-id";
  }
  if (chat.getAttribute("data-conversation-id") != null){
    return "data-conversation-id";
  }
}

function getChannel(chat){
  if (getChatAttribiute(chat) == "data-room-id"){
    return "RoomsChannel"
  }
  if (getChatAttribiute(chat) == "data-conversation-id"){
    return "ConversationsChannel"
  }
}

function messages_to_bottom(element){
    element.scrollTop = element.scrollHeight;
}
