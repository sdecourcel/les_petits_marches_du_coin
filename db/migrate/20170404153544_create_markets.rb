class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.references :location, foreign_key: true, index: true, null: false
      t.references :manager, foreign_key: { to_table: :users }, index: true, null: false
      t.integer :week_day, null: false
      t.time :start_time, null: false
      t.time :stop_time, null: false

      t.timestamps
    end
  end
end
