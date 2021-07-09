require 'rails_helper'

RSpec.describe Vote, type: :model do
  it "is not valid without a cat_id" do
    cat = Vote.new(cat_id: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a user_id" do
    cat = Vote.new(user_id: nil)
    expect(cat).to_not be_valid
  end
end
