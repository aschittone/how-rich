class ChangeColumnOnSearches < ActiveRecord::Migration[5.1]
  def change
    change_column :searches, :buy_price, :float
    change_column :searches, :sell_price, :float
  end
end
