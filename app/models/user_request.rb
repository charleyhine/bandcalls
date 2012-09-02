class UserRequest < ActiveRecord::Base
  attr_accessible :user_id, :artist_id
  
  has_one :user
  has_one :artist
  
end
