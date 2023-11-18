class CreateOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lines do |t|
      t.string :item
      t.integer :quantity
      t.decimal :discount_percentage
      t.decimal :tax_amount
      t.decimal :price_after_discount

      t.timestamps
    end
  end
end
