class CreateCloths < ActiveRecord::Migration
  def change
    create_table :cloths do |t|
      t.string :name
      t.string :icon
      t.references :small_category, index: true, foreign_key: true
      t.string :color1
      t.string :color2
      t.string :design
      t.string :qr
      t.integer :amount

      t.timestamps null: false
    end
  end
end
