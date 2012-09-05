class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone, :full_name
  # attr_accessible :title, :body

  has_many :user_requests
  
  validates_presence_of :first_name, :last_name, :phone
  
  validates_length_of :phone, :in => 10..10, :message => " should be 10 digits e.g. 3037256927"
  
  def full_name
    return self.first_name + ' ' + self.last_name
  end
end