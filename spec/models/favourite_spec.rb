require 'rails_helper'

RSpec.describe Favourite, type: :model do
  it "is not valid without a cat_id" do
    fav = Favourite.new(cat_id: nil)
    expect(fav).to_not be_valid
  end

  it "is not valid without a user_id" do
    fav = Favourite.new(user_id: nil)
    expect(fav).to_not be_valid
  end
end