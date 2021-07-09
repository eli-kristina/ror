require 'rails_helper'

RSpec.describe Role, type: :model do
  it "is not valid without a name" do
    cat = Role.new(name: nil)
    expect(cat).to_not be_valid
  end
end
