import consumer from "./consumer";

const initChatroomCable = () => {
  const messagesContainer = document.getElementById('messages');

  if (messagesContainer) {
    // Scroll to bottom of messages on page load
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
    const id = messagesContainer.dataset.chatroomId;

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        // Add new message
        messagesContainer.insertAdjacentHTML('beforeend', data);
        // Sroll to new message
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
        // Select text input
        let messagesContent = document.getElementById('message_content');
        // Clear text input
        messagesContent.value = "";
      }
    });
  }
}

export { initChatroomCable };
