class AddSubtotalToOrderLines < ActiveRecord::Migration[7.0]
  def change
    add_column :order_lines, :subtotal, :decimal
  end
end
