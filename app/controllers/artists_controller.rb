class ArtistsController < ApplicationController
  def incoming
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'read the message on your screen for your fan. press the star key when finished.', :voice => 'woman'
      r.Record, :action => BASE_URL + '/artists/recording'
    end
    
    render :xml => response.text
  end
  
  def recording
    url = params['RecordingUrl']
    
    @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
    @account = @client.account
    @message = @account.sms.messages.create({
      :from => '+14157428595',
      :to => '+16157915900',
      :body => url
      })
      
    render :nothing => true
  end
end