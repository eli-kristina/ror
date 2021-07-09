class UserRole < ActiveRecord::Base
  validates_presence_of :user_id
  validates_presence_of :role_id
end