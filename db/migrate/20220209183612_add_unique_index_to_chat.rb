class AddUniqueIndexToChat < ActiveRecord::Migration[7.0]
  def change
    add_index :chats, [:application_id, :number], unique: true
  end
end
