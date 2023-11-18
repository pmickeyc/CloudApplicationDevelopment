class RemoveTotalTaxFromOrder < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :total_tax, :decimal
  end
end
