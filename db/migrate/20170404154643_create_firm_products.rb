class CreateFirmProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :firm_products do |t|
      t.references :firm, foreign_key: true, index: true, null: false
      t.references :product, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
