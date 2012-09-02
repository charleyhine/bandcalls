class ArtistCall < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :user_request
  has_one :artist, :through => :user_request
  has_one :user, :through => :user_request
end