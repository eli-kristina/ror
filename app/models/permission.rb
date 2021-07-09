class Permission < ActiveRecord::Base
  validates_presence_of :name
  
  #--[associations]
  has_many :role_permissions
end