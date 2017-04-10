class RemoveRoleFromMarketSuppliers < ActiveRecord::Migration[5.0]
  def change
    remove_column :market_suppliers, :role, :integer
  end
end
