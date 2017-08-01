class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :buy_price
      t.integer :sell_price
      t.datetime :start_date
      t.datetime :end_date
      t.integer :investment_amount
      t.integer :stock_id

      t.timestamps
    end
  end
end
