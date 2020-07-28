import consumer from "./consumer"

$(function () {
  const tweetChannel = consumer.subscriptions.create({
    channel: 'TweetChannel',
    tweet: $('#comments').data('tweet_id')
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function (data) {
      return $('#comments').append(data['comment']);
    },

    speak: function (comment) {
      return this.perform('speak', {
        comment: comment
      });
    }
  });

  $(document).on('keypress', '[data-behavior~=tweet_speaker]', function (event) {
    if (event.keyCode === 13) {
      tweetChannel.speak(event.target.value);

      event.target.value = '';
      return event.preventDefault();
    }
  });
});