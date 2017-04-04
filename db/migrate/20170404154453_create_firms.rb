class CreateFirms < ActiveRecord::Migration[5.0]
  def change
    create_table :firms do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :location, foreign_key: true, index: true, null: false
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
