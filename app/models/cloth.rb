class Cloth < ActiveRecord::Base
  belongs_to :small_category

  has_many :users_cloths
  has_many :users, through: :users_cloths
end
