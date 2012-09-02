class ArtistsController < ApplicationController
  def incoming
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'hello there', :voice => 'woman'
    end
    
    render :xml => response.text
  end
end
