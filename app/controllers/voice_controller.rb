class VoiceController < ApplicationController      
  def entry
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'read the message on your screen for your fan. press the star key when finished.', :voice => 'woman'
      r.Record '', :action => BASE_URL + '/twilio/recording', :maxLength => '120', :finishOnKey => '*'
      r.Say 'Could not understand recording.', :voice => 'woman'
    end

    render :xml => response.text
  end
  
  def recording
    artist_phone = params['To'][2..11]
    recording_url = params['RecordingUrl']
    
    ArtistCall.add_recording_url(artist_phone, recording_url)
    
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Done recording. Thank you.', :voice => 'woman'
      r.Hangup ''
    end
      
    render :xml => response.text
  end
end
