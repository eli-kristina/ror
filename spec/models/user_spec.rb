require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without a username" do
    cat = User.new(username: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a password" do
    cat = User.new(password: nil)
    expect(cat).to_not be_valid
  end
end
