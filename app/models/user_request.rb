class UserRequest < ActiveRecord::Base
  attr_accessible :user_id, :artist_id, :copy
  
  belongs_to :user
  belongs_to :artist
  
  validates_presence_of :user, :artist
end
