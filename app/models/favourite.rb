class Favourite < ActiveRecord::Base
  validates_presence_of :cat_id
  validates_presence_of :user_id
end