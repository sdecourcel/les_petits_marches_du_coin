class CreateMarketSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :market_suppliers do |t|
      t.references :market, foreign_key: true, index: true, null: false
      t.references :user, foreign_key: true, index: true, null: false
      t.integer :role
      t.timestamps
    end
  end
end
