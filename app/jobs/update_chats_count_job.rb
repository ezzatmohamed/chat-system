class UpdateChatsCountJob < ApplicationJob
  queue_as :default

  def perform(application)
    chats_count = ChatRepo.new(application).getChatsCount
    application.update(chats_count: chats_count)
  end
end
