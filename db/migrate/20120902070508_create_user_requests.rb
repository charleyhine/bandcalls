class CreateUserRequests < ActiveRecord::Migration
  def change
    create_table :user_requests do |t|
      t.integer  :user_id
      t.integer  :artist_id
      t.string  :copy

      t.timestamps
    end
  end
end
