class User < ActiveRecord::Base
  has_secure_password

  #--[associations]
  has_many :user_roles

  #--[validations]
  validates :username, :length => { :within => 1..100 }, :uniqueness => { :message => " already exists" }, :on => :save
  validates :password, presence: true
end