class AddColumnToSearches < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :profit, :float
    add_column :searches, :total_return, :float
    add_column :searches, :annual_return, :float
    add_column :searches, :invested_money, :float
    add_column :searches, :shares, :integer
    add_column :searches, :investment_timeframe, :float
  end
end
