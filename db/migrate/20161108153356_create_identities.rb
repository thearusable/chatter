class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.datetime :created_at
      t.datetime :updated_at
      t.string :profile_page
      #t.references :user
    end

    #add_index :identities, :user_id
  end
end
