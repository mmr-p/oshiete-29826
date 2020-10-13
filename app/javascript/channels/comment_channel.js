import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {

    if (data.error == 'undefined') {
      alert("コメントが入力されていません");
    }
    else {
      const comments = document.getElementById('comments');
      const entireComment = document.createElement('li');
      entireComment.setAttribute('class', "entire-comment");
      const commentName = document.createElement('div');
      commentName.setAttribute('class', "comment-name");
      const commentBody = document.createElement('div');
      commentBody.setAttribute('class', "comment-body");
      const commentDate = document.createElement('div');
      commentDate.setAttribute('class', "comment-date");
  
      comments.insertBefore(entireComment, comments.firstElementChild);
      entireComment.appendChild(commentName);
      entireComment.appendChild(commentBody);
      entireComment.appendChild(commentDate);
  
      const name = `${data.name}`;
      commentName.innerHTML = name;
      const body = `${data.content.content}`;
      commentBody.innerHTML = body;
      const date = `${data.time}`;
      commentDate.innerHTML = date;
      const newMessage = document.getElementById('comment_text');
      newMessage.value='';
    }
  }
});
