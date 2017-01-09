class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|

      t.belongs_to :user, index: true
      t.belongs_to :room, index: true

      t.timestamps
    end
  end
end