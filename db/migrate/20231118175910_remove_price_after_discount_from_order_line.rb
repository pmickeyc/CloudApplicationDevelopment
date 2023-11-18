class RemovePriceAfterDiscountFromOrderLine < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_lines, :price_after_discount, :decimal
  end
end
