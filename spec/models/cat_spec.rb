require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "is not valid without a name" do
    cat = Cat.new(name: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a life_span" do
    cat = Cat.new(life_span: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a origin" do
    cat = Cat.new(origin: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a temperament" do
    cat = Cat.new(temperament: nil)
    expect(cat).to_not be_valid
  end

  it "is not valid without a image" do
    cat = Cat.new(image: nil)
    expect(cat).to_not be_valid
  end
end
