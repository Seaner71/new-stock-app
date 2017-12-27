class StocksUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks_users, :id => false do |t|
      t.integer :stock_id
      t.integer :user_id
    end
  end
end
