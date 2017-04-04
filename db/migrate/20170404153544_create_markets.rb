class CreateMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :markets do |t|
      t.references :location, foreign_key: true
      t.integer :week_day
      t.time :start_time
      t.time :stop_time

      t.timestamps
    end
  end
end
