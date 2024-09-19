class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.belongs_to :cart, foreign_key: true, null: false
      t.belongs_to :product, foreign_key: true, null: false
      t.integer :quantity, default: 1, null: false
      t.index [:cart_id, :product_id], unique: true

      t.timestamps
    end
  end
end
