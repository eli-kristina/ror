class Permission < ActiveRecord::Base
  #--[associations]
  has_many :role_permissions
end