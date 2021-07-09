class RolePermission < ActiveRecord::Base
  validates_presence_of :role_id
  validates_presence_of :permission_id
end