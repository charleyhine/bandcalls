class UserRequest < ActiveRecord::Base
  attr_accessible :user_id, :artist_id, :copy, :artist_call
  
  belongs_to :user
  belongs_to :artist
  has_one :artist_call
  
  validates_presence_of :user, :artist
end
