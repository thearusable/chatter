class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
