class Role < ActiveRecord::Base
  #--[associations]
  has_many :user_roles

  #--[validations]
  validates :name, :length => { :within => 1..100 }, :uniqueness => { :message => " already exists" }, :on => :save
end