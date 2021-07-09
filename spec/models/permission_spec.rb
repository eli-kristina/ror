require 'rails_helper'

RSpec.describe Permission, type: :model do
  it "is not valid without a name" do
    cat = Permission.new(name: nil)
    expect(cat).to_not be_valid
  end
end
