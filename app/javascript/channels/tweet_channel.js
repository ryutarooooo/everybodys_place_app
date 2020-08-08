import consumer from "./consumer"


$(function () {

  const commentArea = document.getElementById("comment-area")

  if (commentArea) {
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

      speak: function (comment, mensionUserId) {
        return this.perform('speak', {
          comment: comment,
          mension_user_id: mensionUserId
        });
      }
    });

    const commentButton = document.getElementById("comment-button")
    commentButton.addEventListener("click", function () {
      let content = commentArea.value
      let mensionUserId = commentArea.dataset.mension_user_id
      tweetChannel.speak(content, mensionUserId)
      commentArea.value = ''
      mention.value = ''
      commentArea.dataset.mension_user_id = ''
    })
  }
});