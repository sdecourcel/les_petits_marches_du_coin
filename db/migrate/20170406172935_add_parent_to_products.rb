class AddParentToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :parent, foreign_key: { to_table: :products}, index: true, optional: true
  end
end
