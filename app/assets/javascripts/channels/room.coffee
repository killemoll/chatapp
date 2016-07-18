App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    element = document.getElementById('messages');
    element.innerHTML = element.innerHTML + "<p>" + data['message'] + "</p>"

  speak: (message) ->
      @perform 'speak', message: message

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) -> 
  if event.keyCode is 13 # return/enter = send 
    App.room.speak event.target.value 
    event.target.value = ''
    event.preventDefault()

