class DropUserSearches < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_searches
  end
end
