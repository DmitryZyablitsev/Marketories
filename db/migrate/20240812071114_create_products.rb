class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :specification, null: false
      t.integer :price, null: false
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
