import consumer from "channels/consumer"

const subscription = consumer.subscriptions.create("ChatChannel", {
  connected() {
    console.log("チャットに接続しました")
  },

  disconnected() {
    console.log("チャットから切断しました")
  },

  received(data) {
    this.appendMessage(data)
  },

  speak(name, content) {
    // サーバーにメッセージを送信
    this.perform('speak', { name: name, content: content })
  },
  appendMessage(data) {
    // DOMにメッセージを追加
    const messages = document.querySelector('.chat-messages')
    const messageDiv = `
      <div class="message">
        <div class="message-author">${data.name}</div>
        <div class="message-content">${data.content}</div>
        <div class="message-time">${data.created_at}</div>
      </div>
    `
    messages.insertAdjacentHTML('beforeend', messageDiv)
  }
});
window.chatChannel = subscription;