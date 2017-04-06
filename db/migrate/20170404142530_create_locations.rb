class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.text :address, null: false
      t.text :unique_name
      t.float :latitude
      t.float :longitude
      t.references :owner, foreign_key: { to_table: :users }, index: true, optional: true

      t.timestamps
    end
  end
end
