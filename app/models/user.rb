class User < ActiveRecord::Base
  has_many :users_cloths
  has_many :cloths, through: :users_cloths

end
