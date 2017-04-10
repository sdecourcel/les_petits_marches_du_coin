class RenameOwnerFromLocations < ActiveRecord::Migration[5.0]
  def change
    rename_column :locations, :owner_id, :user_id
  end
end
