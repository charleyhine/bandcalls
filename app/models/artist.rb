class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :phone
  # attr_accessible :title, :body
  
  validates_presence_of :name, :phone
  
  validates_length_of :phone, :in => 10..10, :message => " should be 10 digits e.g. 3037256927"
  
  has_many :user_requests
  has_many :artist_calls, :through => :user_requests
end
