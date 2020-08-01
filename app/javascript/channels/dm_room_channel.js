import consumer from "./consumer"

$(function () {
  const dmArea = document.getElementById("dm-area")
  if (dmArea) {
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
        let message = data['dm']
        const currentUserId = parseInt(document.getElementsByTagName("h1")[0].dataset.current_user_id)
        if (data.send_user_id != currentUserId) {
          message = message.replace('faceicon-right', 'faceicon-left').replace('chatting-right', 'chatting-left').replace('says-right', 'says-left')
        }
        return $('#dms').append(message);
      },

      speak: function (dm) {
        return this.perform('speak', {
          dm: dm
        });
      }
    });

    //   $(document).on('keypress', '[data-behavior~=dm_room_speaker]', function (event) {
    //     if (event.keyCode === 13) {
    //       dmChannel.speak(event.target.value);
    //       event.target.value = '';
    //       return event.preventDefault();
    //     }
    //   });
    // });

    const dmButton = document.getElementById("dm-button")
    dmButton.addEventListener("click", function () {
      let content = dmArea.value
      dmChannel.speak(content)
      dmArea.value = ''
    })
  }
});