class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.belongs_to :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
