class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def speak(data)
    # メッセージをブロードキャスト
    ActionCable.server.broadcast("chat_channel", {
      name: data["name"],
      content: data["content"],
      created_at: Time.current.strftime("%H:%M"),
    })
  end
end
