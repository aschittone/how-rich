class RenameUserIdColumnInRelationships < ActiveRecord::Migration[5.1]
  def change
    rename_column :relationships, :user_id, :follow_id
  end
end
