class RenameManagerFromMarkets < ActiveRecord::Migration[5.0]
  def change
    rename_column :markets, :manager_id, :user_id
  end
end
