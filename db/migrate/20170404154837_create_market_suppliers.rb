class CreateMarketSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :market_suppliers do |t|
      t.references :market, foreign_key: true, index: true, null: false
      t.references :producer, foreign_key: { to_table: :users }, index: true
      t.references :amap_manager, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
