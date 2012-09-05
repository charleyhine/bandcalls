class HomeController < ApplicationController
  def index
    if current_user && current_artist
      sign_out :user
    end
    
    if current_user
      redirect_to artists_path
    end
    
    if current_artist
      redirect_to artist_requests_path
    end
  end
end