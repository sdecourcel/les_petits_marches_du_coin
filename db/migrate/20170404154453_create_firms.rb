class CreateFirms < ActiveRecord::Migration[5.0]
  def change
    create_table :firms do |t|
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
