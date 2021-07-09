class Cat < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :life_span
  validates_presence_of :origin
  validates_presence_of :temperament
  validates_presence_of :image
end