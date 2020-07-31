import consumer from "./consumer"

const chatChannel = consumer.subscriptions.create("DmRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received: function (data) {
    return alert(data["dm"]);
  },

  speak: function (dm) {
    return this.perform('speak', {
      dm: dm
    });
  }
});

$(document).on('keypress', '[data-behavior~=dm_room_speaker]', function (event) {
  if (event.keyCode === 13) {
    chatChannel.speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});