require 'rails_helper'

RSpec.describe RolePermission, type: :model do
  it "is not valid without a role_id" do
    cat = RolePermission.new(role_id: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a permission_id" do
    cat = RolePermission.new(permission_id: nil)
    expect(cat).to_not be_valid
  end
end