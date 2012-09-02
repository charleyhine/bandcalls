class ArtistCall < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one artist
  has_one user
end
