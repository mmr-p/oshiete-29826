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
      const chatContentArea = document.getElementById('chat-content-area');
      const entireMessage = document.createElement('div');
      entireMessage.setAttribute('class', "your-messages");
      const chatSender = document.createElement('div');
      chatSender.setAttribute('class', "chat-sender");
      const chatText = document.createElement('div');
      chatText.setAttribute('class', "chat-text");
      const chatDate = document.createElement('div');
      chatDate.setAttribute('class', "chat-date");
  
      chatContentArea.insertAdjacentElement('beforeend', entireMessage);
      entireMessage.appendChild(chatSender);
      entireMessage.appendChild(chatText);
      entireMessage.appendChild(chatDate);
  
      const name = `${data.name}`;
      chatSender.innerHTML = name;
      const body = `${data.content.content}`;
      chatText.innerHTML = body;
      const date = `${data.time}`;
      chatDate.innerHTML = date;

      const fakeChatContentArea = document.getElementById('chat-content-area');
      const fakeEntireMessage = document.createElement('div');
      fakeEntireMessage.setAttribute('class', "fake-your-messages");
      const fakeChatSender = document.createElement('div');
      fakeChatSender.setAttribute('class', "chat-sender");
      const fakeChatText = document.createElement('div');
      fakeChatText.setAttribute('class', "chat-text");
      const fakeChatDate = document.createElement('div');
      fakeChatDate.setAttribute('class', "chat-date");
  
      fakeChatContentArea.insertAdjacentElement('beforeend', fakeEntireMessage);
      fakeEntireMessage.appendChild(fakeChatSender);
      fakeEntireMessage.appendChild(fakeChatText);
      fakeEntireMessage.appendChild(fakeChatDate);

      fakeChatSender.innerHTML = name;
      fakeChatText.innerHTML = body;
      fakeChatDate.innerHTML = date;

      const newChatMessage = document.getElementById('message_text');
      newChatMessage.value='';
    }
  }
});