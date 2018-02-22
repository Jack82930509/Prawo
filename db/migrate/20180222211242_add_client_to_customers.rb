class AddClientToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_reference :customers, :client, foreign_key: true
  end
end
