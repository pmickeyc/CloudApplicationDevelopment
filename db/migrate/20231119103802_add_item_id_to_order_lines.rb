class AddItemIdToOrderLines < ActiveRecord::Migration[7.0]
  def change
    add_column :order_lines, :item_id, :integer
  end
end
