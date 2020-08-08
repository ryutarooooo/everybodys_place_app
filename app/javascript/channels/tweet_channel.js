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
        $('#comments').append(data['comment']);
        const commentArea = document.getElementById("comment-area")
        const mention = document.getElementById("mention")
        const lastBox = document.querySelectorAll(".box-name")
        lastBox[lastBox.length - 1].addEventListener("click", e => {
          const name = e.target.innerText
          const userId = e.target.dataset.user_id
          mention.value = `@${name}`
          commentArea.dataset.mention_user_id = userId
        })
      },

      speak: function (comment, mentionUserId) {
        return this.perform('speak', {
          comment: comment,
          mention_user_id: mentionUserId
        });
      }
    });

    const commentButton = document.getElementById("comment-button")
    commentButton.addEventListener("click", function () {
      let content = commentArea.value
      let mentionUserId = commentArea.dataset.mention_user_id
      tweetChannel.speak(content, mentionUserId)
      commentArea.value = ''
      mention.value = ''
      commentArea.dataset.mention_user_id = ''
    })
  }
});