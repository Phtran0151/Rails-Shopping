class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :completed_at
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end
