class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      t.string :requested_id
      t.boolean :request, :default => false
      t.boolean :friend, :default => false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
