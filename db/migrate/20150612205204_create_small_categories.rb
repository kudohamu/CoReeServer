class CreateSmallCategories < ActiveRecord::Migration
  def change
    create_table :small_categories do |t|
      t.string :name
      t.references :big_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
