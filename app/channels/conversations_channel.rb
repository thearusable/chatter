class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{Conversation.name}_#{params['room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    Conversation.find(data['room_id']).messages.create!(body: data['message'], user_id: data['sender_id'])
  end
end
