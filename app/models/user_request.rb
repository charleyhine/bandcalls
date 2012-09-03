class UserRequest < ActiveRecord::Base
  attr_accessible :user_id, :artist_id, :copy, :artist_call, :notify_user
  
  belongs_to :user
  belongs_to :artist
  has_one :artist_call
  
  validates_presence_of :user, :artist
  
  def notify_user
    @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
    @account = @client.account
    @message = @account.sms.messages.create({
      :from => '+14157428595',
      :to => '+1' + self.user.phone,
      :body => self.artist.name ' has recorded a personalized message for you -> ' + self.artist_call.recording_url
      })
  end
end
