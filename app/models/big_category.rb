class BigCategory < ActiveRecord::Base
  has_many :small_categories
end
