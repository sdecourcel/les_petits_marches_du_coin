class AddMarketPlaceToMarkets < ActiveRecord::Migration[5.0]
  def change
    add_column :markets, :market_place, :boolean, null: false, default: false
  end
end
