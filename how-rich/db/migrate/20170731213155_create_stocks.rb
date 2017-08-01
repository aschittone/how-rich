class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :ticker_symbol

      t.timestamps
    end
  end
end
