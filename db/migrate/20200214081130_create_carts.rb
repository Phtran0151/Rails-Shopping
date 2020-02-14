class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :completed_at, null: false
      t.decimal :subtotal, null: false
      t.decimal :total, null: false

      t.timestamps
    end
  end
end
