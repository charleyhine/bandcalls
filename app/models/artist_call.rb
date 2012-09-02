class ArtistCall < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :user_request
  has_one :artist, :through => :user_request
  has_one :user, :through => :user_request
  
  def create_and_call(user_request)
    @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

    @call = @client.account.calls.create(
      :from => '+14157428595',
      :to => '+1' + user_request.artist.phone,
      :url => BASE_URL + '/artists/operator'
      )
      
    ArtistCall.create(user_request: user_request)  
  end
  
  def self.save_recording_url(artist_phone, recording_url)
    artist = Artist.find_by_phone(artist_phone)
    call = ArtistCall.where(:artist_id = artist.id, :recording_url => '')
    call.recording_url = recording_url
    call.save
  end
end