class CreateUsersCloths < ActiveRecord::Migration
  def change
    create_table :users_cloths do |t|
      t.references :user, index: true, foreign_key: true
      t.references :cloth, index: true, foreign_key: true
      t.boolean :buy

      t.timestamps null: false
    end
  end
end
