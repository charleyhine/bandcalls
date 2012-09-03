class ArtistCall < ActiveRecord::Base
  attr_accessible :place_call, :user_request
  
  belongs_to :user_request
  has_one :artist, :through => :user_request
  has_one :user, :through => :user_request
  
  def place_call
    @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

    @call = @client.account.calls.create(
      :from => '+14157428595',
      :to => '+1' + self.artist.phone,
      :url => BASE_URL + '/twilio/entry'
      ) 
  end
  
  def self.save_recording_url(artist_phone, recording_url)
    artist = Artist.find_by_phone(artist_phone)
    call = ArtistCall.where(:artist_id => artist.id, :recording_url => '')
    call.recording_url = recording_url
    call.save
  end
end