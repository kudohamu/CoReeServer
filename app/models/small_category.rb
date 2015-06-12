class SmallCategory < ActiveRecord::Base
  belongs_to :big_category

  has_many :cloths
end
