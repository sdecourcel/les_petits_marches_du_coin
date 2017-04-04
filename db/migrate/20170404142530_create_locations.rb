class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :address, null: false
      t.float :latitude
      t.float :longitude
      t.references :resident, foreign_key: { to_table: :users }, index: true
      t.references :owner, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
