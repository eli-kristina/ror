require 'rails_helper'

RSpec.describe UserRole, type: :model do
  it "is not valid without a user_id" do
    cat = UserRole.new(user_id: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a role_id" do
    cat = UserRole.new(role_id: nil)
    expect(cat).to_not be_valid
  end
end