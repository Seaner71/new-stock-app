class AddFieldsToToStocks < ActiveRecord::Migration[5.1]
  def change
    add_column :stocks, :ticker, :string
    add_column :stocks, :account_id, :integer
    add_column :stocks, :shares, :integer
    add_column :stocks, :sname, :string
    add_column :stocks, :name, :string
  end
end
