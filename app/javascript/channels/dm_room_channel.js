import consumer from "./consumer"

$(function () {
  const dmChannel = consumer.subscriptions.create({
    channel: 'DmRoomChannel',
    receive_user_id: $('#dms').data('receive_user_id')
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function (data) {
      return $('#dms').append(data['dm']);
    },

    speak: function (dm) {
      return this.perform('speak', {
        dm: dm
      });
    }
  });

  $(document).on('keypress', '[data-behavior~=dm_room_speaker]', function (event) {
    if (event.keyCode === 13) {
      dmChannel.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
});