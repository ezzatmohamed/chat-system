class UpdateMessagesCountJob < ApplicationJob
  queue_as :default

  def perform(chat)
    messages_count = MessageRepo.new(chat).getMessagesCount
    chat.update(messages_count: messages_count)
  end
end
