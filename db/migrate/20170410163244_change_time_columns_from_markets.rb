class ChangeTimeColumnsFromMarkets < ActiveRecord::Migration[5.0]
  def change
    remove_column :markets, :start_time, :time
    remove_column :markets, :stop_time, :time
    add_column :markets, :start_hour, :integer
    add_column :markets, :start_min, :integer
    add_column :markets, :stop_hour, :integer
    add_column :markets, :stop_min, :integer
  end
end
