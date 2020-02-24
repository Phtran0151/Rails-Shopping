class CreateCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts do |t|
      t.string :name
      t.references :email, null: false
      t.string :address
      t.string :phone
      t.string :message

      t.timestamps
    end
  end
end
