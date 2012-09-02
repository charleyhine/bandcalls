class CallsController < ApplicationController
  BASE_URL = "http://bandcalls.herokuapp.com"         

  def incoming
     # Get artist by phone number
     artist_phone = params['From'][2..params['From'].size]
     @artist = artist.find_by_phone(artist_phone)

     # Welcome message.
     # "Welcome to #{@artist.name}'s residence."
     # Ask agent to identy him/herself.
     # "Please enter your code"
     if @artist.nil? 
       render :action => "no_artist.xml.builder"
     else
       @post_to = BASE_URL + "/verify?artist_id=#{@artist.id}"
       render :action => "incoming.xml.builder", :layout => false
     end
   end

   def direction    
     @artist = artist.find(params[:artist_id])
     @agent = Agent.find(params[:agent_id])
     @message = @artist.task_list
     @post_to = BASE_URL + "/direction?agent_id=#{@agent.id}&artist_id=#{@artist.id}"

     # 1 to hear the tasks again, 2 to check out, 3 to hang up.
     if params['Digits'] == '1'
       render :action => "direction.xml.builder", :layout => false
     elsif params['Digits'] == '2'
       @agent.check_out(@artist.id)
       @goodbye_message = "Thank you for your service today."
       render :action => 'goodbye.xml.builder', :layout => false
     elsif params['Digits'] == '3'
       @message = "Yang is the most awesome guy ever - both personally and professionally. He is pretty sexy, too."
       render :action => 'direction.xml.builder', :layout => false
     elsif params['Digits'] == '4'
       @goodbye_message = "Have a great day."
       render :action => 'goodbye.xml.builder', :layout => false
     end
   end
end
