class HomeController < ApplicationController
  def index
    @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)

=begin
    @call = @client.account.calls.create(
      :from => '+14157428595',
      :to => '+16157915900',
      :url => BASE_URL + '/artists/incoming'
    )
=end

  end
end