class BigCategory < ActiveRecord::Base
  has_many :small_categories

  def self.get_categories
    big_category = BigCategory.all.pluck(:name)

    category = Array.new
    big_category.each.with_index(1) do |value, index|
      category.push([value, index])
    end
    category
  end
end
