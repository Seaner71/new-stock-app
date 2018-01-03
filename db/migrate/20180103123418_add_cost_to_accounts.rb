class AddCostToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :cost, :float
  end
end
