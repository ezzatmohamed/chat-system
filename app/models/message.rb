class Message < ApplicationRecord
  belongs_to :chat

  include Elasticsearch::Model::Callbacks
  include Elasticsearch::Model
    
  settings index: {number_of_shreds: 1} do
    mapping do
      indexes :id, type: :integer
      indexes :content, type: :text
      indexes :chat_id, type: :integer
    end
  end
end
