class CallsController < ApplicationController
  BASE_URL = "http://bandcalls.herokuapp.com"         

    def incoming          
      # Get client by phone number          
      client_phone = params['From'][2..params['From'].size]          
      @client = Client.find_by_phone(client_phone)               

      if @client.nil?               
        render :action => "no_client.xml.builder"
      else
        @post_to = BASE_URL + "/verify?client_id=#{@client.id}"
        render :action => "incoming.xml.builder", :layout => false
      end
    end
end
