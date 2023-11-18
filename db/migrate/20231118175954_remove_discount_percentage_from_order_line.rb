class RemoveDiscountPercentageFromOrderLine < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_lines, :discount_percentage, :decimal
    remove_column :order_lines, :tax_amount, :decimal
  end
end
