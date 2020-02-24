class RemoveColumnEmailFromCheckouts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :checkouts, :email, null: false
  end
end
