class AddGeneralConditionsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :general_conditions, :boolean, null: false
  end
end
