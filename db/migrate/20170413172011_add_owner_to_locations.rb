class AddOwnerToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :owner, :boolean, default: false, null: false
  end
end
