jQuery(document).on('turbolinks:load', function() {

  var allChats = document.getElementsByClassName('messages');
  for (var i = 0; i < allChats.length; i++) {
    var founded = false
    for(sub of App.cable.subscriptions.subscriptions){
      if(allChats[i].getAttribute("data-room-id") == ( JSON && JSON.parse(sub.identifier) || $.parseJSON(sub.identifier) ).room_id){
        founded = true
        break;
      }
    }

    if(founded == false){
      App.cable.subscriptions.create({
        channel: "RoomsChannel",
        room_id: allChats[i].getAttribute("data-room-id")
      }, {
        connected: function() {},
        disconnected: function() {},
        received: function(data) {
          console.log(data)
          var message_boxes = $('.messages')
          id = ( JSON && JSON.parse(this.identifier) || $.parseJSON(this.identifier) ).room_id;
          for(var i = 0; i < message_boxes.length; i++){
            if (message_boxes[i].getAttribute("data-room-id") === id) {
              message_boxes[i].innerHTML += data['message'];
            }
          }
          //return messages_to_bottom();
        },
        send_message: function(message, room_id) {
          return this.perform('send_message', {
            message: message,
            room_id: room_id
          });
        }
      });
    }
  }

  $('textarea.message_body').keypress(function(event) {
      if (event.which == 13) {
          var msg = event.target.value
          var room_id = event.target.parentNode.getAttribute("data-room-id")

          //find proper subscription and send message (all on first subscritpion also works)
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

/*
  var messages, messages_to_bottom;
  messages = $('#messages');
  if ($('#messages').length > 0) {
    messages_to_bottom = function() {
      return messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();
    App.global_chat = App.cable.subscriptions.create({
      channel: "RoomsChannel",
      room_id: messages.data('room-id')
    }, {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        messages.append(data['message']);
        return messages_to_bottom();
      },
      send_message: function(message, room_id) {
        return this.perform('send_message', {
          message: message,
          room_id: room_id
        });
      }
    });
    return $('#new_message').submit(function(e) {
      var $this, textarea;
      $this = $(this);
      textarea = $this.find('#message_body');
      if ($.trim(textarea.val()).length > 1) {
        App.global_chat.send_message(textarea.val(), messages.data('room-id'));
        textarea.val('');
      }
      e.preventDefault();
      return false;
    });
  }
});
*/
