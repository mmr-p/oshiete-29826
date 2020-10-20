import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
  },
  disconnected() {
  },

  received(data) {
    if (data.error == 'error') {
      alert("コメントが入力されていません");
    }
    else {
      const fakeMessages = document.getElementById('messages');
      const fakeEntireMessage = document.createElement('div');
      fakeEntireMessage.setAttribute('class', "fake-my-messages");
      const fakeChatSender = document.createElement('div');
      fakeChatSender.setAttribute('class', "chat-sender");
      const fakeChatText = document.createElement('div');
      fakeChatText.setAttribute('class', "chat-text");
      const fakeChatDate = document.createElement('div');
      fakeChatDate.setAttribute('class', "chat-date");
  
      fakeMessages.insertBefore(fakeEntireMessage, fakeMessages.firstElementChild);
      fakeEntireMessage.appendChild(fakeChatSender);
      fakeEntireMessage.appendChild(fakeChatText);
      fakeEntireMessage.appendChild(fakeChatDate);
  
      const name = `${data.name}`;
      fakeChatSender.innerHTML = name;
      const body = `${data.content.content}`;
      fakeChatText.innerHTML = body;
      const date = `${data.time}`;
      fakeChatDate.innerHTML = date;

      // const messages = document.getElementById('messages');
      // const entireMessage = document.createElement('div');
      // entireMessage.setAttribute('class', "my-messages");
      // const chatSender = document.createElement('div');
      // chatSender.setAttribute('class', "chat-sender");
      // const chatText = document.createElement('div');
      // chatText.setAttribute('class', "chat-text");
      // const chatDate = document.createElement('div');
      // chatDate.setAttribute('class', "chat-date");
  
      // messages.insertBefore(entireMessage, messages.firstElementChild);
      // entireMessage.appendChild(chatSender);
      // entireMessage.appendChild(chatText);
      // entireMessage.appendChild(chatDate);

      // chatSender.innerHTML = name;
      // chatText.innerHTML = body;
      // chatDate.innerHTML = date;

      const newChatMessage = document.getElementById('message_form');
      newChatMessage.value='';
    }
  }
});