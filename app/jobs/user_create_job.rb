class UserCreateJob < ApplicationJob
  queue_as :default
  
  # set all new created user as 'authenticate_user' roles
  def perform(user_id)
    role = Role.find_by_name("authenticate_user")

    if role.present?
      UserRole.create(user_id: user_id, role_id: role.id)
    end
  end
end