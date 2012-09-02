class ArtistsController < ApplicationController
  def index
    @artists = Artist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artists }
    end
  end

  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end
  
  def incoming
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'read the message on your screen for your fan. press the star key when finished.', :voice => 'woman'
      r.Record '', :action => BASE_URL + '/artists/recording', :maxLength => '120', :finishOnKey => '*'
      r.Say 'thank you', :voice => 'woman'
      r.Hangup ''
    end
    puts response.text
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