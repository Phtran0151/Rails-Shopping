class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :pay_method

      t.timestamps
    end
  end
end
