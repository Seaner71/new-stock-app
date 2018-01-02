class AddAccountTypeTo < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :account_type, :string
  end
end
