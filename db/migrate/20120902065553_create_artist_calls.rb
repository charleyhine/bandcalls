class CreateArtistCalls < ActiveRecord::Migration
  def change
    create_table :artist_calls do |t|
      t.integer :user_request_id
      t.string  :recording_url

      t.timestamps
    end
  end
end
