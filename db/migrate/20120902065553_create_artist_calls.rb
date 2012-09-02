class CreateArtistCalls < ActiveRecord::Migration
  def change
    create_table :artist_calls do |t|
      t.integer  :artist_id
      t.integer  :user_id
      t.integer  :recording_url

      t.timestamps
    end
  end
end
