class Role < ActiveRecord::Base
  validates_presence_of :name

  #--[associations]
  has_many :user_roles
end